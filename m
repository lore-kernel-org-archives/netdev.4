Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795013475;
	b=d1kahs6BLqVSIHat5ShPIVr5INHNHHbW8E0ZE2XmOGR1dzsc6N5ygazuTa1MnmYqXvz2
	 Y55KZb/l1jr0LvcovPRWCKDpchlYm04MrXvLwLCHBmhJ3WcMVXTh4UqLXb0i+FdOMog8v
	 GN8kaK5raUZB+v1PUfNOSJIwGmRX32wiWCAUBb42+akZxkFxevMtXsSu8E1TdF+ik5v7j
	 4pq5bGw/d35OsS1KNgbqJvVad7M5paads/1hDhS/Mk3wmTKkXkN3QJAsrCRqSHpwPVk6b
	 w37wtFawdpSwDn8mmDi5ccat9ft7RYmZZqLx7R5sEftaz6HTKKR3kB8v+5LPLtfkjVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795013475;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=WSCsgAKxJUrVu2FjCTH1xjYHsvtRyOSkfSVa/p3473o=;
	b=FI9YNPfgtCi2i6ozZwYC/9mwsiMk9PU3z+3L8f8NZiBklitx7DWBqR7eNWFkxe0sNEsG
	 J6LtpbQPun9UUH3dMyHqGADdpjzDKvVbEAlgLCgsfv7GQJg5Prnv7qsJ2Ao3cdrTIjLrm
	 EmjXv9Dvd7C01aAHeCRO7RV6GBxsan60Jk7dGV8YeP3GOs+QsAduy6Zoq4TvBt1TjQmTa
	 QPHuOFRYXtnUu5TnCHfmh4CnLdkhSFQNBHYaOKrPkXYBPmSHE0SPXCZi3LklwCpLQmT/u
	 H+Jie9gPBeFpg3gUs3k1vU5P7+vUipsIaIkToT2zLJnNkfLufukFNBQkMVp3Dngg8Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=CGV7Qlbp;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C565606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 14:51:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C565606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=CGV7Qlbp
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso8085445ad.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 06:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795013474; x=1795618274; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WSCsgAKxJUrVu2FjCTH1xjYHsvtRyOSkfSVa/p3473o=;
        b=CGV7QlbpoG4eseJ6uOsu+1uU7//h+KEayDyzB1+14l/NLi8f1aLWReNQcobv+Xsbq0
         a+kdzo9Cy9A/FdiInwEGiDCenmwYZj/Zn55qzD4JWIh+a49RBYJonvzMAgJIOJgZAxdc
         Pbrf/88FhAg1AP7qDbzhHHkRc57DGvyd+2XkkGwslv22kBUvcqUEVfODSEnwuHVpnF2E
         UbNEBK/v1aQbD/mjmeeq8ldym993HLC0gNtWi4LIU2BmaYnfhm4doV7h39ukfo3Nr1/K
         e9TsDHQIKFTjt+y2Kq7EX03J7wek+Z8RUY5VL+wtXcYny3Du/3Fg0rAlZJrEH1l8TEuB
         7ouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795013474; x=1795618274;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WSCsgAKxJUrVu2FjCTH1xjYHsvtRyOSkfSVa/p3473o=;
        b=gpnJ8E5SR3Zi6WwBLLAq30OOagvGyf2sGYc8W6mFJQrCTyIPepZeqaR2BHwujvoUy2
         3BNcQY3P1qLTvDgC39YSQKclV71a3oM50JFUnrFxfxXaKnVvWEW7GFI/5lEqZXuwhfF2
         6nr6Mn4RtWBX2iPK7IPL+umK0JC3nCwyo9sopiLv55owTWGy1S8H9DQntv4D+z9M6aBH
         /je0VQmzRjrkySAQbCBjCKB1g2YWVV/7K9bQRyns5Wsg82D/YBAmaWAmSx8Nc6dHEHue
         PbKpUGAkOoW9L+dlCEaehjBo4QpU+gz4lWMkaG9OogK1EBTdQ/bUqaq9UHWeqYVvwbOc
         pQSA==
X-Forwarded-Encrypted: i=1; AL+hErGu1r5sbOU0SemsdyAOZr5I+RB8FwbtAkZb3XMfcORZtdTalHs1lwwuznpMLQaabOoWlhWrxkU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/H3eyGRdhuqbkbitbg0qJ3ydP5+l4F5cuyezFvrf67uxUO803c
	Gqx9JDc+P4zHgAsmDkV5tW+L8+jIJF7m2yIIrDOeoR9zrCkBt+QNkSQCdRgLwvgJUiQ=
X-Gm-Gg: AZFdTZdEh6W2mKpYwIBtaUv0g6srx7JHEKb0BJAyyYvH2mcGEOHfd7oJM6+UgCXNZaM
	gqYdnE8//pUZf2rLWVpISubAUzPxQbwI8YYGpuH8O37mO3m1Cj16mLKXCAQPvbT01sblg/gRPLx
	mNdAq5tXbvWStc1L/1i7n9z1rW8NxtDNeZticDVa2UFtNoLf2ooIyAwS3USa73rP8m00QyfCARK
	3LFYt4J5aDHkknfCu20WCkSLsfqvpQ4m13XGoO11c1qOHx0tk6XrOiSaxhmuLcK10hZAAwnKbvb
	37pRvxZEGyfK64oTp7E6wgTNHgS1mJADCCdpbXbN4ibV9LBvE6IGPZKPgNo4FvnkSZeZDSP5ylb
	wo8bKaVEGDZTZYuQ9fiKugYzK4ziKlBpfyMZJGRpk0YkYrQ8HqsxnlZ0AZkIamD+9rMcbxyPtNM
	Va2F+efw32KmbMGGM7YMP1xHuMG8JImpOBRsJX07nQhqxZEs/GXYNANsRC3A8Ry5MeZXgPBcDEa
	c/6hntuD2lZvprtHC1YokUfi8RNCSRCibMC7I2QAXHgXOuyf0NLfK9KnPACrqpNIVyrd3IgrN6b
	49kD/7pp8MwxQqMxlhPgEAnRhgCPHg13OBIPBgB7GtEXy06WhBmDjBuQ9BoopoWd
X-Received: by 2002:a17:902:d583:b0:2ed:84c6:5f5 with SMTP id d9443c01a7336-2eff742389emr26059555ad.38.1795013474445;
        Wed, 18 Nov 2026 06:51:14 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:73::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff5ed0998sm16028135ad.4.2026.11.18.06.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:51:13 -0800 (PST)
Date: Wed, 18 Nov 2026 06:51:13 -0800
From: Joe Damato <joe@dama.to>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, michael.chan@broadcom.com, netdev@vger.kernel.org,
	edumazet@google.com, pabeni@redhat.com, andrew+netdev@lunn.ch,
	horms@kernel.org, pavan.chebbi@broadcom.com
Subject: Re: [PATCH net-next 5/6] eth: bnxt_en: allocate fast path DMA rings
 on the queue's NUMA node
Message-ID: <av27YWHXFVft/rvS@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net,
	michael.chan@broadcom.com, netdev@vger.kernel.org,
	edumazet@google.com, pabeni@redhat.com, andrew+netdev@lunn.ch,
	horms@kernel.org, pavan.chebbi@broadcom.com
References: <20261118023905.3050661-1-kuba@kernel.org>
 <20261118023905.3050661-6-kuba@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118023905.3050661-6-kuba@kernel.org>

On Tue, Nov 17, 2026 at 06:39:04PM -0800, Jakub Kicinski wrote:
> Descriptor rings, completion rings, NQs and the TX push buffer are
> accessed by the host in the fast path, and so is the SW state around
> them, which we already allocate on the node of the CPU expected to
> service the queue. The DMA memory itself comes from the device's node,
> though, as that's what dma_alloc_coherent() always uses.
> 
> Use dma_alloc_coherent_node() for the ring pages and the TX push buffer.
> Pass the queue's node for completion rings and NQs as well, they used
> NUMA_NO_NODE so far since @nid only affected the SW rings.
> 
> Ring page tables are only read by the device, keep them on the device's
> node.
> 
> Note that queue restart only reallocates the Rx descriptor rings.
> Completion rings, NQs and Tx rings will follow IRQ affinity changes
> only on the next full reconfiguration.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
>  drivers/net/ethernet/broadcom/bnxt/bnxt.c | 24 +++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)

Reviewed-by: Joe Damato <joe@dama.to>
