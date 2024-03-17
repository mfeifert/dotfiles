(defhydra hydra-maf (:color blue :hint nil)
  "

Main Menu
---------

_1_: Health
_2_: Finance
_3_: Journal
_4_: Media
_5_: Auto
_6_: Reading
_7_: Bach

"
  ("1" hydra-maf-health/body)
  ("2" (find-file "~/docs/finance/2023.ledger"))
  ("3" (find-file "~/docs/journal/2023.txt"))
  ("4" hydra-maf-media/body)
  ("5" hydra-maf-auto/body)
  ("6" hydra-maf-reading/body)
  ("7" hydra-maf-bach/body))

(global-set-key (kbd "C-'") 'hydra-maf/body)

;;; Health hydras

(defhydra hydra-maf-health (:color blue :hint nil)
  "

Health
------

_1_: Water
_2_: Yoga
_3_: Run
_4_: Strength

"
  ("1" hydra-maf-health-water/body)
  ("2" hydra-maf-health-yoga/body)
  ("3" hydra-maf-health-run/body)
  ("4" hydra-maf-health-strength/body))

(defhydra hydra-maf-health-water (:color blue :hint nil)
  "

Water
-----

_1_: Recent entries
_2_: New entry

"
  ("1" (message "SQL query"))
  ("2" (message "SQL insert")))

(defhydra hydra-maf-health-yoga (:color blue :hint nil)
  "

Yoga
----

_1_: Recent entries
_2_: New entry

"
  ("1" (message "SQL query"))
  ("2" (message "SQL insert")))

(defhydra hydra-maf-health-run (:color blue :hint nil)
  "

Run
---

_1_: Recent entries
_2_: New entry

"
  ("1" (message "SQL query"))
  ("2" (message "SQL insert")))

(defhydra hydra-maf-health-strength (:color blue :hint nil)
  "

Strength
--------

_1_: Recent entries
_2_: New entry

"
  ("1" (message "SQL query"))
  ("2" (message "SQL insert")))

;;; Media hydras

(defhydra hydra-maf-media (:color blue :hint nil)
  "

Media
-----

_1_: Star Trek: The Original Series
_2_: Star Trek: The Next Generation
_3_: Master Keaton
_4_: Movies

"
  ("1" hydra-maf-media-tos/body)
  ("2" hydra-maf-media-tng/body)
  ("3" hydra-maf-media-mk/body)
  ("4" hydra-maf-media-movies/body))

(defhydra hydra-maf-media-tos (:color blue :hint nil)
  "

Star Trek: The Original Series
------------------------------

_1_: Episodes
_2_: Random episode

"
  ("1" (message "SQL"))
  ("2" (message "SQL")))

(defhydra hydra-maf-media-tng (:color blue :hint nil)
  "

Star Trek: The Next Generation
------------------------------

_1_: Episodes
_2_: Random episode

"
  ("1" (message "SQL"))
  ("2" (message "SQL")))

(defhydra hydra-maf-media-mk (:color blue :hint nil)
  "

Master Keaton
-------------

_1_: Episodes
_2_: Next episode

"
  ("1" (message "SQL"))
  ("2" (message "SQL")))

(defhydra hydra-maf-media-movies (:color blue :hint nil)
  "

Movies
------

_1_: Movies list
_2_: New entry

"
  ("1" (message "SQL"))
  ("2" (message "SQL")))

;;; Auto hydras

(defhydra hydra-maf-auto (:color blue :hint nil)
  "

Auto
----

_1_: New fuel entry
_2_: Services

"
  ("1" (message "SQL"))
  ("2" (message "SQL")))

;;; Reading hydras

(defhydra hydra-maf-reading (:color blue :hint nil)
  "

Reading
-------

_1_: Reading list
_2_: New entry

"
  ("1" (message "SQL"))
  ("2" (message "SQL")))

;;; Bach hydras

(defhydra hydra-maf-bach (:color blue :hint nil)
  "

Bach
----

_1_: lookup all BWVs for calendar day
_2_: lookup already listened BWVs for calendar day
_3_: New entry

"
  ("1" (message "SQL"))
  ("2" (message "SQL"))
  ("3" (message "SQL")))
