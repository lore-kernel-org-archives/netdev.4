Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630376;
	b=gndr+oWEbvwGTuRTI/bxk6HDQVKLxwjrE7DqT6zW/W9KleHvC9+awNNA4kajBTIOoV/j
	 POS3T8aMyXmf7ocnmSUwa+T01lAnd1w/kZCeXKIRyPRNME48J9GOqNzR6SPcNImgxcpeE
	 vzmFVmSVQRcxFw/GdKwiQPNDG3NXEej3aNnf9wlzNvWtpghYmT7o+n1nkVPAZ68kEs8N2
	 gu+aOajLNx6Jhhs2v8Rde38lO6lfrERkltMXPRZCKku6hi9Nh3kdHYPAKUQBqkmJtTRlN
	 XNpgX6BVKN+PCtBDHWsCVFVhAED/RQcs0dU2F0baZKT8BTJZtPH6AAt0tvzL16vaeAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=+jl2a6MD9u0WX2eMTbDkIYQ14DZ1p7jge40/5A1LWnc=;
	b=f8uZXPUG/ivIotCHm3O10pjDJ5S/vF5n5hOIPxp+9Awex3eo8kYf9iAZ/paZGy5N/UmE
	 4JrAxHwuBHp+yRylxW945J8SqxSpgiDjOFZQhxENo6QSPsRWl0Kb8aeEEOb5cljWykBjD
	 i8lGGYWQgs4KSVtqo5u31+Q0+Tsg/4J1YRacqUC+q3RTtrGz1IA4MiDiT3Jgxhk/Mpd62
	 sUgyWxNa7WVu0OWfaIPPv2iASCyHBAHcWm4Sq5qXdvll0e7/BxJp6et1xDbZ6WdVhug5v
	 6ydSKbFmi+b/ipAjwvNl3Gt5ONXc654uaTiD+9EOevi66uQZY+vqlUvoL0Ic8dhca1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=AUVQ8n8v;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E08C606A330
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 18:12:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E08C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=AUVQ8n8v
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2f04bea9a93so54187455ad.3
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 10:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795630375; x=1796235175; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+jl2a6MD9u0WX2eMTbDkIYQ14DZ1p7jge40/5A1LWnc=;
        b=AUVQ8n8vozaET4HwbCoMH0xZZwpgdCqh97occpv/jvNdyD0E7lpv9k+hF7Dw1ZyrHn
         6E3pUIlfiU3BhYvz1CrNVO66p8mRkVsW4NZZn+lHm1qwISIJOmHmr1+inve9hmL5lE8o
         5CtMmI5WTsf4hh6Wd/z4fkk/tyYrFZbgTfewKszSFaBaLcm4UazQTOcfhR3/LhUrmHem
         LsZ33r08IpAHg9sV/kdrTmtV6esnQ0rPvPjPi3ebL/9LH2104htXAZZN7MED10by8E5L
         5TcsFnSfpwEf0JF/IlLVtZ0+p4mfK1FqKQDHotTAUKfDCDZrKeIBVdLU/kokkhRiNsH4
         aPNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795630375; x=1796235175;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+jl2a6MD9u0WX2eMTbDkIYQ14DZ1p7jge40/5A1LWnc=;
        b=oVXUeHeM9Tf2bcu+o+lM5YgdbPA1+GmBuj24DnNbMLOO/8e7yez7HvfxtofdW8IMsk
         7WW8Qzfhw0MXdumhbIuJ4eJT3R5WTxXesa46piyphf4pSasptydUt1L5+pG7/ZOQGhqm
         ADdzX+hMWeMiCZUt68v/AkWGhBaiTJ7/9nBfnThE+EmKBUje3tP10IYQBLps7XuSyBDm
         fLEa+POGwsm8bo9pSApvOe5AjOzDmFgTg5So31FY5Mbz7Ctwm52urj3AwY1o3owl453E
         lPdPn7xCFuD4niO2NRxwWEp4T6EQm8LzJOJWCtV01tCh7Xj8hf7QjWIuQk980ED4R0Up
         3S0w==
X-Forwarded-Encrypted: i=1; AL+hErH9PXX53h8khWR7W1IuQg5jLuypoRzIZkmAFAurZ/QsuUmuFkqxyq7DYUazT9vsWeFmnXbXjyA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SBZPvpa9oyRw9PQ5CBgj/e0UC/L6qXHtYkMtiysW0br/k5srI
	thxOlyxsfBo+Vm2kozWhHxVIZuSCYn64shD6Matf/lXUFzsLPX7GbT402eSb4zoW0bHx7K4kMML
	Jd68J
X-Gm-Gg: AZFdTZetmmjk/FDY9u5rn25zYI2EmX5Xp965jhFGq3eOSu/SgLEKlWHyLmb28TFASL1
	bXkiShAha/w/ZWW1JcE5d3sIpLqO2qS4eROeRmJz0MwF5+3ziO5e0z86ZcHYH2I4OWXyeV2uEgF
	H3ypyrh0r8Z6sAQgls68pejmaQfQlKM8v+1rRJnclq8AzmXbLQPaEykkykCu+MzJapkCx32zZw2
	bb6eSuKoC29HUcvA9G08YUJIHYulYiQ43594OPks/olkADJRGupU80hoCY1jYQITd2YLTn1sSR5
	t19oFcn2hFUAVvYKO+ZZRWYG5AOLWAlfm+nPQaRaYY2e8YE6tMnH9S5c8ZpIRIaC/JtfX3bZw4g
	k5LwqzbapRRpg7MjhW5bPnYD0QtIRjsepTvwkAxFUSAyPt3UsFe2EXXwuBEx+9BJ+J/7LQCP/gI
	qisv0i58ZN60O8WnKTjFY4eYOoudnY0uJaOY1pB6Uzl1M761jMdl86P7DFQRmVTOHcOW5YB6W5M
	YtmzxQMgZ8pivdaR/ufFlch+Ky2sTnPquS355QA+rx9E3nMk7y63TWKvbRrXWP9loO2W+fKf0Tx
	6dhn36eZL5qHrcPKgApAcjuInBBJHStvlJ0RUjCfOw==
X-Received: by 2002:a17:902:ec8a:b0:2ed:a8bc:6d9e with SMTP id d9443c01a7336-2f03f1ed325mr201637065ad.30.1795630375416;
        Wed, 25 Nov 2026 10:12:55 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:5::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1482c3sm89337525ad.73.2026.11.25.10.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:12:54 -0800 (PST)
Date: Wed, 25 Nov 2026 10:12:53 -0800
From: Joe Damato <joe@dama.to>
To: mdshahid03@gmail.com
Cc: tariqt@nvidia.com, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
	netdev@vger.kernel.org, linux-rdma@vger.kernel.org
Subject: Re: [PATCH] net/mlx4: fix error propagation in mlx4_load_one()
Message-ID: <awclJaYkHbGuXdqv@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, mdshahid03@gmail.com,
	tariqt@nvidia.com, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
	netdev@vger.kernel.org, linux-rdma@vger.kernel.org
References: <20261125022913.205366-1-mdshahid03@gmail.com>
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
In-Reply-To: <20261125022913.205366-1-mdshahid03@gmail.com>

On Wed, Nov 25, 2026 at 07:59:13AM +0530, mdshahid03@gmail.com wrote:
> From: Mohammad Shahid <mdshahid03@gmail.com>
> 
> The return value of mlx4_check_dev_cap() is not assigned to err at
> two places in mlx4_load_one().
> 
> If the helper return an error ,execution jumps to err_fw,but err may
> still contain zero from the previous successful operation.
> 
> Assigning the helper's return value to err ensures that the error is
> correctly propagated.
> 
> Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
> ---
>  drivers/net/ethernet/mellanox/mlx4/main.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>

Looks right to me

Reviewed-by: Joe Damato <joe@dama.to>
