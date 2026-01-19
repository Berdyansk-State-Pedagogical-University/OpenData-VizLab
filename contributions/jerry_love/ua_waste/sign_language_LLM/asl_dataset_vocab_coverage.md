# Vocabulary Coverage of an ASL Dataset

Author: Jerry Love  
Dataset: https://www.microsoft.com/en-us/download/details.aspx?id=100121

## Description
The chart shows how much of the American Sign Language (ASL) dataset vocabulary, used for training sign language recognition models, ChatGPT could match, highlighting the proportion of glosses for which it generated valid synonyms compared with the cleaned vocabulary subset. 

This dataset, covering over 200 signers and 1,000 signs under challenging and unconstrained recording conditions, enables training of models for RGB-based sign language recognition without specialized hardware. Findings from the sampled vocabulary indicate strong coverage of conversational terms, suggesting that language models can effectively complement ASL datasets and support interactions between text generating models and sign language tasks.

## Tools used
- R (jsonlite, dplyr, waffle, ggplot2)
- ChatGPT (vocabulary matching and synonym validation)
- Data source: MS-ASL: A Large-Scale Data Set and Benchmark for Understanding American Sign Language