# Cookbook Day 1 correction

```
         _________________________________________________________________
        |                                                                 |
        |   App                    )\._.,--...,'``.                       |
        |                        /,   _.. \   _\  (`._ ,.                 |
        |                       `._.-(,_..'--(,_..'`-.;.'                 |
        |                        |     Router     |                       |
        |                        |________________|                       |
        |                                |                                |
        |                         _______\/_______                        |
        |     _________          |                |                       |
        |    | 1.Model |         |  3.Controller  |                       |
        |    |_________|         |________________|                       |
        |            \             /            \                         |
        |             \___________\/_        ___\/______________          |
 ___    |             |              |      |                   |         |
|CSV|<--------------->| 2.Repository |      | 4.View(puts,gets) |         |
'---'   |             |______________|      |___________________|         |
        |_________________________________________________________________|
```
## Todo
1. Model ✅
2. Repository ✅
3. Controller/View ✅
  - As a user I can list all the recipes
  - As a user I can add a recipe
  - As a user I can remove a recipe

# Cookbook Day 1 correction

## Todo
1. Import recipes from the web (let's use Service!) 
2. Add a @rating property to Recipe 
3. (User Action) Mark a recipe as done 
4. Add a @prep_time property to Recipe 