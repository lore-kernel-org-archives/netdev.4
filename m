Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794937761;
	b=dXyUVsRlY2R7ALSXj/wSOIMOfLfWiZsHwrsjPQwFBjeakwBnScdCVDOdvkDbgs4Mu+0T
	 fdHMThMTrGXUKmKBDbUflXMV0oyXh6D+jDb/cW3daQzaEbANJ/ZPzlNIutmV1srWQQpn1
	 TD4SXFP2tkyRveuzPb5eoj+9Re+GBZpKkihH2ekTPyloHulOicv11kDY1guQVanMFdRRm
	 03g3m2tk0tNEBWnxLmSm6XVJmAmXQwS2yWl7OZdDsGa7G+HAWsioNG2itNVy/TDFDXiY1
	 0s3DJF0sVJgP+RvYm3RDR7cMK6amwwaFiviFQznI2Nn2A11DpvU2PFy9jOn4NvOuGQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937761;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=5rmXe4SVtybipEf84HgdD3RWzcvPSP8W7SzBl5mqv2U=;
	b=vAvSMMfkZa6P4GC4p37Qz7vW0J6r8fpBV20In7RqqFg9lCSRag05zPVMo1bHVxfk8mZb
	 SHPKno8w1A+R9fMem9ionQeakyTnC9DYeB6DBkttfvf2U514ZpKTaBQmE14VQZLDjRfm5
	 gmRDmIMpN5o/k6FHUfrVzsS9jGDU2h2J6yJPkk56IkfW75r/FkfmMn3AApn8EVu7/7Bmb
	 MRU6CkrRvzQVbjqFdhUwhvfOKGqLw7xouVrah1+JUoiIyvksFTqeQ8Z1+7KeGKbpU8FkM
	 fzI7K1ze3R1FZhkHvqxkVIjVWri1UjNkCdDGejf+MISc1EJlmlVVhOxV2WZFc61KpEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="M98/h/CH";
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253EF606A880
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 17:49:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 253EF606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=M98/h/CH
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8b58d6f67a5so32855b3a.2
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 09:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1794937760; x=1795542560; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5rmXe4SVtybipEf84HgdD3RWzcvPSP8W7SzBl5mqv2U=;
        b=M98/h/CHkP9jUgWcY+JMOdnYQ10O4Z9Cty9tDp7uWuak2zaftGvTxMA5CMCAmnIT6t
         SZFlbCIHD3KFb4n/stH+qBZf9/W3oTiPNIMKSxc1LEiYzWOOq82yPWJdH4w+BHocXNzv
         soLqYkF9cLUEqQW3meU3w8CEGfZrDaMNZ3Y55FsLXlG08gH6F/3tHcBdAQasXgMPLqte
         yac0CQjNmTToG6B9W1pR/tR9pYopEiQ6R02XaqV1pUtY4p5CL+KvKmzGAcT6sfYB1nVk
         b9QS4YoQIEhK/zG6VkVcAfVmq5DrRmwQJG9Jwk3HbG+pzXtV4Mu/N5FJKq0zi4nZT4gP
         9fQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937760; x=1795542560;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5rmXe4SVtybipEf84HgdD3RWzcvPSP8W7SzBl5mqv2U=;
        b=0Sm4M6/6bE9InxpqQTZ7hZ5m5A4snVetXR/DelpoSTMOjLOPOvcG6vUfMOlOY8gkv5
         FwIkuw6+2lD1Y76xCmRZ0isawmv4bpyufGiVFxNFciki9UPtI7S/ZBkVm/R56tgL4xdV
         Kve/QM8bDfuc1lMQ66l3VBwdnm9LM5S8g8dlQ7h4ZH0H3aYlUWiYR7Bh6XZSHbzmQM2O
         6oYCN6Vjd8D3Kvy0of++7mKAOS6aHppRcZ4bYh3YR3zQokaytl0j3QKkFV5uqBcV/I9s
         D8iKSKJi0NmOv/tRbTwUIN3pL0Wvn3g1AqjH8fhLtSfWHSVyLLTx7dX6dqQ7MbNiSLOj
         dAAw==
X-Forwarded-Encrypted: i=1; AL+hErF/mD8zEsoQ1K/QmqyYAD55TrKWVa5OCa1Tize8Qh9SYLlCcS9hopjZdRNV3lta9G2OzcUgGoM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XuH7tEVad+RntT8F/0pgZnrKaDT0SJAg26/fOLga8+OQ8Dj6p
	kDeck1EgZz9SS7IkhmnXnIq4flagbjdqLBHXA2uGSxHYBVEm0G7P23b/a4NLIb4xfFM=
X-Gm-Gg: AYBFou1KZ81NO/uiQS7FJmIQhBuh8J0pOxQsImdmZpKmBePKmWePqewXJWY0YHnzrcA
	o8jJv4rIGiDi+5DmE/jR6m/zBv2aBUDoDgo5tbVETCfE7iBECg7CLsKMxuU5CeYN8kB3Na6WtuK
	Y5QF/tDtRTm7bnp/eyvPi5W6PLvNsXYiaAv1sfSdzXWBsJwZPjOprk6AJPYkER6NCHEjRPuwrdG
	8vFEd1xAYuiLaK0CPaUWnnWijoR8eH0vuCYEcWEDru8S876D6uLoqHZeYWrZsGkm6J9WfNcRlVc
	sn2vdBrl6fSsyE9+oUh+T/nOeI4ALEdzNxU4/VR1XHQfcVJgc3AsiyJ62nhZ5iA04+KnIbz4O5v
	iMlHx8+8wFgGtznu3QN6nxNfoNsc9MLeIWCUBUwGBO77YHEOdAGUM/CHs+cIrI+m5qd+qH53mKg
	/8wM/OGyAp8Q+Hud1WrlsTQcgvEnakFGj3/fsh/8K07MX3635fmaJKpXSEp2bWHQ8chnY/2RqWt
	tgBAq+ew1ET2QM8oBObeMQWOELQqVz1OxB8N5e6M1O39h0ikuXBWAS8MEorGDvWANMbV2Tr8NDY
	4jnXTmR0PRivfs609/ADxgpskI5+a9G3A9oFQclM0u0=
X-Received: by 2002:a05:6a00:94d3:b0:89c:d875:602a with SMTP id d2e1a72fcca58-8beb56cd09cmr14335328b3a.11.1794937760420;
        Tue, 17 Nov 2026 09:49:20 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:47::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cb54e413sm7290b3a.43.2026.11.17.09.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:49:19 -0800 (PST)
Date: Tue, 17 Nov 2026 09:49:18 -0800
From: Joe Damato <joe@dama.to>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Nikolay Aleksandrov <razor@blackwall.org>,
	Ido Schimmel <idosch@nvidia.com>, bridge@lists.linux.dev,
	netdev@vger.kernel.org
Subject: Re: [PATCH] net: bridge: avoid redundant strlen() in
 show_backup_port()
Message-ID: <avyTnnR3xnUSnPmU@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Dmitry Antipov <dmantipov@yandex.ru>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Ido Schimmel <idosch@nvidia.com>, bridge@lists.linux.dev,
	netdev@vger.kernel.org
References: <20261117165106.635733-1-dmantipov@yandex.ru>
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
In-Reply-To: <20261117165106.635733-1-dmantipov@yandex.ru>

On Tue, Nov 17, 2026 at 07:51:06PM +0300, Dmitry Antipov wrote:
> In store_backup_port(), prefer strchrnul() over strchr() to
> avoid redundant call to strlen().

a couple things:

- i dont't think the change is worth it because it feels like unnecessary
  churn in a path that isn't a hot path. how many bytes are we really avoiding
  counting here?

- commit message mentions store_backup_port but subject line says
  show_backup_port, so commit would need to be respun

but imho i think this should be dropped
