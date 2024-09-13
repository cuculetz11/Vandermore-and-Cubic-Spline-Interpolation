# Vandermore-and-Cubic-Spline-Interpolation
# Descrierea Metodelor de Interpolare

## Interpolare Cubica Spline

1. **Citirea datelor**:
   - Deschidem fisierul din care citim vectorii de puncte `x` si `y`.

2. **Construirea matricei spline**:
   - Creez matricea `mat`, urmand toti pasii pentru calculul coeficientilor functiilor spline cubice. Aceasta matrice ne permite sa gasim coeficientii polinoamelor spline pentru fiecare interval dintre punctele `x`.

3. **Calcularea valorilor pentru puncte noi**:
   - Pentru fiecare punct nou `x` care trebuie evaluat, cautam intervalul in care se afla si folosim polinomul spline corespunzator pentru a calcula valoarea `y`.

---

## Interpolare Vandermonde

1. **Calculul matricei Vandermonde**:
   - Construiesc matricea **Vandermonde**, unde fiecare element este o putere a punctelor `x`, specifica fiecarui polinom. Aceasta matrice este utilizata pentru a rezolva sistemul de ecuatii si pentru a obtine coeficientii polinomului de interpolare.

2. **Rezolvarea sistemului**:
   - Dupa ce am construit matricea Vandermonde, rezolv sistemul de ecuatii liniare asociat pentru a determina coeficientii polinomului de interpolare.

---

## Comparatie intre Interpolarea Cubica Spline si Vandermonde

- **Spline Cubic**:
   - Aceasta metoda calculeaza polinoame de grad mic (cubice) intre fiecare pereche de puncte consecutive. Este utila atunci cand vrem o interpolare neteda, continua, cu derivata continua.
   - Avantaj: metoda este stabila si produce rezultate bune chiar si pentru seturi mari de date.

- **Vandermonde**:
   - Aceasta metoda implica construirea unui polinom unic de interpolare care trece prin toate punctele date.
   - Avantaj: polinomul este unic si exact, dar poate deveni instabil pentru seturi mari de date din cauza formei numerice a matricei Vandermonde (care poate avea un conditionament slab).

---

Aceste doua metode ofera abordari diferite pentru interpolare, fiecare avand avantaje in functie de aplicatie si de numarul de puncte disponibile.
