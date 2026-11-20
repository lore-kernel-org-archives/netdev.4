Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182618;
	b=MFdwijhMTpJAbEItIi1IQi0xZN1Rfm/9Gd7VW7tD5/0fiZ9gDDzlKhLWbPYe4z0tnr+R
	 c8MQR4uiycFRNsPNKsv95/0YkBzJMYVOvYZpzkVD6E5MWazXYyrebZeENBWjvX5TxD336
	 38XCiDa/eTXv7nJ0Q4rmBd6wi1eccWDtJOK2CA5LkNi4VtT1QvNMmFrMYxp3pBSh5nJ5l
	 Jx+4oJkI+V3SNmqgMf0QoyKCtg4G3jp942xuDKLF/7H2wusbNjzf40vtNwTkBLy7+ViPE
	 ka7kfUTCxicEkmNgGiGRh82BOmmZxyGFUDXUD2X9cF5b0+knmBb3Oanhifluu2W15Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182618;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=uU+g78pFe3woDmujMNPfhZ/0Qi8mHsxDvK4Ws3nTpkw=;
	b=32y/u70HortXsjWq+kKymEij9a9g44MVgyrsDZ2N6PAg04Fnzryjt9VJNiuxwIxp9+WH
	 gdqGrSMQQtg4iyLN64KXaX8W8ooWgWzNqoymjGdyp65pATmrpC7cJlQ0xykkZHboNdMoK
	 qMBjTQb/z/bJOyIxgJR9xGuoRviO37coehXNIwJ55Kem5CZLdB2ZmPlCNl0X/VIzMRDtM
	 XyaUdAh8TSERfAucb8qTTRWcWz1FRe0WH0RXwDF+nDtqJ22FJPlsMqyZS1wj8thT5N10U
	 2ex5bYCWJkK89E71+7f/5vP54f9bwBcn+XeKZCQhf41o6/BD1ZxQvmXj8Ap03fmq4Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=ehz6mMEB;
	arc=none smtp.remote-ip=209.85.222.180
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BAB606A335
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 13:50:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90BAB606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=ehz6mMEB
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-949680e6d82so131312085a.2
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 05:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795182616; x=1795787416; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uU+g78pFe3woDmujMNPfhZ/0Qi8mHsxDvK4Ws3nTpkw=;
        b=ehz6mMEBp7FU9O4IkG6ucYOPrN/2FptPlSVzAMegQhkSAM21Hz39XQX76haUWfk977
         A2S7LqWAyzQ/MMpQcJ9hlw5/i8t5QmFoKEbwfS2++6OthszxDFhEwhu48SFckK+V0pvW
         ZrB7pLti4QW/zlyDdG0NHqvUQqc55WcUlTDasvdx4/7cbllh7O44dOopIvf3GjZWbJGD
         Hp2pPFYqt09CILTVYoO85olovSxlw20uhMs3fEFAaJjWsbuz4Ruyjz74FAK8xTbPsjJm
         YNZjjLR6Muw2SduJu6y83jD/L3yp3ZXbUhG9xHOIQjqowZufFq2KjlStO23Q1v2+do05
         Ehqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182616; x=1795787416;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uU+g78pFe3woDmujMNPfhZ/0Qi8mHsxDvK4Ws3nTpkw=;
        b=iyrT8Zqn5kjEIVQQG9LP3//mGDfW7usN8oT9J8ucKdqFvE6YREFDSt9UbZQSJV4i8O
         8Bnl283nSnttRMA6+u613/MaT1f6MeWeCHtmMehWWY053llT8eAHeprCXF8Afn78CR8J
         udp8vlg2+FMNBvpgWedhLCYnS0yejy0cXP5mySZPzcGorFuYjPH7I6qPsXm+ib0xu6Gl
         XPlONRqYsxWTeTAmuyy0jLX2dNdc9VRDjGx4ReqgP3o/sMzs0N3lES2Tv9zveGroLZNy
         GDvRElW3BRtxhn5R9pe2NerjDdTqg3+xr+ebiSRZpag3GaZ/9PjrTxRI22qQQ19qUKUy
         DwSQ==
X-Forwarded-Encrypted: i=1; AL+hErFln2ZqK1z1hTkXSYeTUqxNna7AsLsoxnyQjnotVRI97CAX1fHYJeN0FXYuXlEbHuZQoL9VqMg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8smmMpLWlymaWY8pY/AK2VGykAk4CEp1EZIpGlxQfkaszKAh5m
	fAtseppCrThVsk4K+rI142tyPjQGr2oPBidG4LzL8+i3zQs51hAhfxnhnNcoMwqIjsI=
X-Gm-Gg: AYBFou1HMltlXIjKERGcvo7vOoQiV2rZ1s4J6iSL0LnxdlXKxH6u9CLPGtHmnwp5/TC
	q/iRhS7vzTwEUHgfjhP27QwE4cwwcNmevxdsw3o7pEGQAtCuNROVus7PI9Mu0Sk2vnWy74SXhLA
	EWVs64WTvGzOggRJyXPQNWglvmXmt4cRQvC3Gx/NChmRVEmk+Yaag18/5oCxUW8QGYtt+zcgokE
	HyaKF8M6EvQ/saN+vox2YpL6w5pQpwTPa7ZOvmr34v0eJ63suoqk0hFZpp3aWlNgKVjGnr+KfgZ
	ecqy8BrYiVoKnvO99OUA/WRORxnSlylIt6tnTfP+tNvOWSplRgQE91hqUxmd651Pqs5j7+jzfq0
	PYl4RKf7c+/Rm2A1wvjxI5IEZdn1YTf3+OdqE5zbgojefPnmCKSLncxRCyBMN9/iriZBnH/M/dw
	t2T/utl5s9/BOdRFvGgSbDABaHOUiuEvYS6IwzWV8bnYOS+ZHcC/wUcaT1OJMX57w7OFqkzhe+W
	LCQhpYnvnK7+FeRQkYjS2WfwR0pBnfKJAaYe2gadtLhMVXc0BXu5JwadEhhvHKhTA/BhjrhPaLH
	AUFCvQ==
X-Received: by 2002:a05:620a:4111:b0:939:5cd5:e243 with SMTP id af79cd13be357-949ba80f8acmr491343985a.6.1795182615989;
        Fri, 20 Nov 2026 05:50:15 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3f7cf3sm190597085a.31.2026.11.20.05.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:50:15 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xUP0H-00000003hHG-3ovL;
	Fri, 20 Nov 2026 09:50:13 -0400
Date: Fri, 20 Nov 2026 09:50:13 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Luigi Rizzo <lrizzo@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Vlastimil Babka <vbabka@kernel.org>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Jens Axboe <axboe@kernel.dk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Luigi Rizzo <rizzo.unipi@gmail.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Zi Yan <ziy@nvidia.com>, Harry Yoo <harry@kernel.org>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Hao Li <hao.li@linux.dev>, Matthew Wilcox <willy@infradead.org>,
	Jan Kara <jack@suse.cz>, Jann Horn <jannh@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Simon Horman <horms@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Willem de Bruijn <willemb@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Joshua Washington <joshwash@google.com>,
	Harshitha Ramamurthy <hramamurthy@google.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Christoph Hellwig <hch@lst.de>,
	Dragos Tatulea <dtatulea@nvidia.com>,
	Naman Gulati <namangulati@google.com>,
	Pranjal Shrivastava <praan@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Randy Dunlap <rdunlap@infradead.org>, linux-mm@kvack.org,
	iommu@lists.linux.dev, netdev@vger.kernel.org,
	linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	driver-core@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v3 00/25] PISA: Pre-mapped IOVA Superpage Allocator
 for DMA and CoCo
Message-ID: <20261120135013.GO3115493@ziepe.ca>
References: <20261109182533.3594984-1-lrizzo@google.com>
 <20261120010655.467825-1-lrizzo@google.com>
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
In-Reply-To: <20261120010655.467825-1-lrizzo@google.com>

On Fri, Nov 20, 2026 at 01:06:30AM +0000, Luigi Rizzo wrote:
> This is v3 of the RFC previously posted as DMA_PMD [0], now renamed PISA
> ("Pre-mapped IOVA Superpage Allocator"). The text below follows
> Documentation/core-api/pisa.rst (patch 25/25), which has the details.

I thought the conclusion was to just do this stuff in netdev pagepool,
now you come with an enormous AI series spread across the entire
kernel?

> - Needs bounce buffers: in Confidential Computing VMs, PISA allocators
>   pre-decrypt 2MB pages in place, avoiding swiotlb bounce-buffer copies.

It seems this was ignored too. We want the bounce buffers in CC. They
serve a security purpose. You cannot loose control of the shared
memory buffers have have them leak into SKBs, user mappings and so
on. It is not secure.

I don't see how any of this is valuable or necessary for CC,
especially when we really don't even expect to have an vIOMMU for CC
very often..

Jason
