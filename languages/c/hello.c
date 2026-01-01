/* Hello world, C edition: a tour of the syntax. */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>

#define MAX_NAME 128
#define SQUARE(x) ((x) * (x))

#ifndef VERSION
#define VERSION "1.0.0"
#endif

typedef enum { QUIET = 0, LOUD = 1 } level_t;

typedef struct greeting {
    char name[MAX_NAME];
    level_t level;
    uint32_t times;
    struct greeting *next;
} greeting_t;

static const char *const LANGS[] = {"en", "de", "fr"};

static greeting_t *greeting_new(const char *name, level_t level) {
    greeting_t *g = malloc(sizeof *g);
    if (g == NULL) {
        return NULL;
    }
    strncpy(g->name, name, MAX_NAME - 1);
    g->name[MAX_NAME - 1] = '\0';
    g->level = level;
    g->times = 0u;
    g->next = NULL;
    return g;
}

static void greeting_free(greeting_t *g) {
    while (g != NULL) {
        greeting_t *next = g->next;
        free(g);
        g = next;
    }
}

int main(int argc, char **argv) {
    greeting_t *head = greeting_new(argc > 1 ? argv[1] : "world", LOUD);
    if (!head) {
        fprintf(stderr, "out of memory\n");
        return EXIT_FAILURE;
    }
    switch (head->level) {
    case QUIET:
        puts("hello, quietly");
        break;
    case LOUD:
        printf("HELLO, %s! %d %f %c 0x%X\n", head->name, SQUARE(3), 3.14f, 'x', 0xFFu);
        break;
    default:
        break;
    }
    for (size_t i = 0; i < sizeof LANGS / sizeof LANGS[0]; i++) {
        printf("%s%s", LANGS[i], i + 1 < 3 ? ", " : "\n");
    }
    greeting_free(head);
    return EXIT_SUCCESS;
}
