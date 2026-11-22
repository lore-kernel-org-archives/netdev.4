Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.201
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795417852;
	b=nBkV81qVURJEEwWnNRvlNx6RtvtZ+EQ9MiNxoGGhd3Tw8u7vW03AWI/dZMd0DhFaUdo5
	 PZOzZQKafWrsBtgqN42yVQrYa1yvSqD/PSepQEAiNvZF9/VgV8svcnltvg4ctxVegzSNg
	 Gyc83c2PxIwUgm6Ti1lqrH1FjgeHUNxGj6xspf1O8EdqaJ6O7tCJe3kuUmSENHdBdrv5K
	 Wa0LPVuImqjhnfjtKpAW4ZRX8GO1chbWgHbY6vw2HUBd3vbC09YeT0K8Nryav/FC232Rp
	 ruCd+ZMBFiUwQyZ6GE37lZMjftbzD9qUpQP8FviHr6/H1oyBVAQfF6oJHGhZ1dRaxQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795417852;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:To:
	 Cc:Message-Id:In-Reply-To:References;
	bh=r4RwmZps41fj2CRRB7nPBKAkftUVFENZ05OVvoEB4bk=;
	b=i1d7xK3bSZdZ3swxb3Y3upbzo5M6zdcSFRbRY5VrVIclXux1eV0FhOL+s35HHaFYV1uR
	 aLcyqFP+OpHqZRJc1uZn1PKuydb5h+bGbBWOEtNMUSxiqalYEl6KypTwGHJp20tN2k7WA
	 wTyk3Q2VBs3MfmsIbWURrDQrgPHwMtLll3gqdvVv6ehZhRHtZfiIB7pfftxax1sqO0s9z
	 Ue/wW9ITp51kmy+YnECc7ywAPruXfUF+Rgz2fYbnjF6oC6KNZ4bdQ9dqVLGn7y/rHnfvV
	 6he6Y2dQSvKfuBTlxWMeCEr9HhuszQFGfkUTJj9s8WdjeXHiWPHAdc1SAiOPJyNDtXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B2OVzeuL;
	arc=none smtp.remote-ip=74.125.227.201
Received: from mail-pi2-f9.google.com (mail-pi2-f9.google.com [74.125.227.201])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5CB606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 07:10:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD5CB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B2OVzeuL
Received: by mail-pi2-f9.google.com with SMTP id 41be03b00d2f7-cdb8dad8ea5so262849a12.1
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 23:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795417851; x=1796022651; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:cc:to:subject:date:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=r4RwmZps41fj2CRRB7nPBKAkftUVFENZ05OVvoEB4bk=;
        b=B2OVzeuLo/x3lo8zd4OuXwug68t8qt00GHURu+GnN9S5EfP1kqD0eqJwj7rvwRSR3c
         Fm/TY19oYciuhPH7f3BY0NgQpzbJZ/2b10lZOgqODQZnsLVZI9Ex5hx/hOpxjOL9lPJW
         c2D+Q/MjqJTqn5xj0Ht7WlON8kjQo6udNdqvXWpvYl9mXUzv8IBPVKfhfap4g7d5BA2B
         neTbwDAKksIH9rtRf9BKxM5Wa4IrJQKpsJfqqsYkgYwE7nSwRhm/uDEpj54d8FF7vLYl
         hgZgTU5InVpx5UiZPvkxF77YCvHVX7S7Wp+9CA4wzf0jdhu8+iLJmZNzbFqVhZZiSw3C
         vhBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795417851; x=1796022651;
        h=references:in-reply-to:message-id:cc:to:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r4RwmZps41fj2CRRB7nPBKAkftUVFENZ05OVvoEB4bk=;
        b=cZApGkIS5cWmCVY28Z3z19HPgvIeEOvEHr1MoW/u4UroE2Vy9e2tyqFnAiCmsHv8xM
         EsDjq0aI/iKSMO5pAuoJ7GhfOG/scmrmrCo69P8vPkqJiulqD/WqXwaOWZizkFKHdQZ2
         O3Kf5Bv1kmUsbK9qjmEcYKwh/U2H87lEizJuF3eqqBtSJSpix2n/S60xdn5rCtoEa9jH
         oLySra21QgMBOMcyLVCEZmEMMu4OCvuWHKQmBPvMnVDmPUB9qhxBpCIfN03qbdsjc4NE
         ljLOjdFDGf3/ObOnTsdj8cVlN4NMxQ89qKR2H5orb1Dl0e9eqYB8Xhii4uf4e11yrI8k
         l9Aw==
X-Gm-Message-State: APuU4Z9ryNWEGz5bgQ+U95zDZdCI6XhQaCcRx5XYwMk+f8NFueKPAzU6
	lBTCQODbVjLbZV5qb7mYhSIn+MY0PSwph3ySXn9hsdKRYXGdSkCX4wb4kz3MNxvHuYMxDwSV
X-Gm-Gg: AZFdTZeVA7RCyvKUMKQOn3At4HCqIS1znU/HiKaoTJc2IpgdL/PxD8kpNoeFey3GKLL
	aZ1LvF3U/lL3ZF6bIc+a7X2KC3PElpyj8NEKDxcjQXe7fOPDr9w9+i9nodEu+XND9BhuXzwq19w
	eBUCkCtrI15d5/JrL7jZWmKKVPfUfbkHHjI1ULRZPtlL+aGGDfFc2OYJvTCLLcDKaeaf780EuUs
	FtH4p62cKBnuBzj9/7HexKfqab0q49H5KLO+FTdXsjwiGiI+wocGHB49EwZg/XJbCX7ihKHKdo3
	PDyL6cnylR5jJVcgOJpdOoFJXqEgweTFhO065btIPMFIVHw9AgzfsdzpSjtSBThBJ8oYI0R6YR4
	2xIYj7GOAoLNauv8EI04SXhGzWqVUvb8/xXIpm8nbPwQ65S1vQRpP1/qh7WPi2Uk4tLESTJ5HHc
	vmmHUQqK7iSCV2KEDMusFz+QuY61tSmQwoLp66lK8d2QPNajpMqAtWbl9pfD62dcC8q/7lje6Se
	jpsWV7ZEYWPkVZZY+//CIB7d5SZWdlCBDl/zQvP7ocwHB5hCD/AXplFt9ySWX3pI2Ijbg1cQYQt
	qdWR72uA7/ZyNwFUIuYHC8Ej4Lsfbk878naqf5/G/q1bnYnFztM7yRa5
X-Received: by 2002:a05:6a20:e617:b0:3f3:3a08:3e04 with SMTP id adf61e73a8af0-40148fc2e0emr9980581637.9.1795417850924;
        Sun, 22 Nov 2026 23:10:50 -0800 (PST)
Received: from smtp.n0ps1edzz.local ([120.253.139.222])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde7f91c6f5sm2684104a12.27.2026.11.22.23.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 23:10:50 -0800 (PST)
From: Zhou Qiuyue <n0ps1edzz@gmail.com>
Date: Mon, 23 Nov 2026 07:10:45 +0800
Subject: Re: [PATCH net] ipv4: ip_output: fix use-after-free in ip_mc_output()
To: netdev@vger.kernel.org
Cc: Chengfeng Ye <nicoyip.dev@gmail.com>,
    Hyunwoo Kim <imv4bel@gmail.com>,
    David Ahern <dsahern@kernel.org>,
    Ido Schimmel <idosch@nvidia.com>,
    David S. Miller <davem@davemloft.net>,
    Eric Dumazet <edumazet@kernel.org>,
    Jakub Kicinski <kuba@kernel.org>,
    Paolo Abeni <pabeni@redhat.com>,
    Simon Horman <horms@kernel.org>,
    Hangbin Liu <hangbin.liu@linux.dev>
Message-Id: <20261123161000.4.n0ps1edzz@gmail.com>
In-Reply-To: <20261123133000.3.n0ps1edzz@gmail.com>
References: <20261123133000.3.n0ps1edzz@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list

Please disregard this patch.  It is a duplicate of pre-existing work on
the same ip_mc_output() path:

  https://lore.kernel.org/netdev/ahveCu-zzFlpeVut@v4bel/
  https://patchwork.kernel.org/patch/14852717/

Hyunwoo Kim's v1-v3 series already covers ip_mc_output(), and Chengfeng
Ye's v2 uses the same skb_dst_dev_rcu() fix.  I missed both when checking
for prior work before posting; there is nothing new in my patch, so
please drop it.

Sorry for the noise.

Thanks,
Zhou Qiuyue

