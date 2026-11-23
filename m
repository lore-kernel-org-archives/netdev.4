Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795449949;
	b=xoak1NNPT56o4973MohGmFUVM25jeXUls7hO9dYnIiSZufgCckue+cKrcYNvvAEsYXA6
	 OTXEGCie7gAZDH+IjHZeOFs68W346AMBlBtDGz1NmMuM8uCD2bw9RkRHglb1zCQWdEzSA
	 nED6auxjWRfUg55R77L+BhjuBwlHSlmsAShuCuWn0WmuG76pvWr6fKYWgsThXrmhl0m0v
	 882XMkLo9/S64hqSnTYISnvj0/mt1nW0EsYpZ+/mp56ow8ecl78XtNc+seYv1N8EBzZQg
	 tiN2051s/AcYvdqYp6nAdHgcUNhFdirRFdDBIWruktwI4z/C0qO4TM7zZUFZoGQp0TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449949;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=advUGfCdbBqYraOvKgooJOlxekjlOweJjjeGy6AjTKs=;
	b=fUVwtD6bCA9z8RmXo4ripOUyVAkYlO9iVLQQrwFZIKTAKNB8QmWgIgmKfoKO4Sf4GDXE
	 qK2XJN26iTmJCS8iXdIq/rwosqx3HrybwU9a8S4+uYy9nfp5wq93jjiqfcnIInaFFmaDe
	 wGwRmhW5zE8PiUwMy7iIUIsOU3forHLVv3J8k4eZmAoFlCr97ZSvhhD4lzbA83nuzvP+g
	 +5hvXMAVjnuZQIseXyHPcTwtrRYFic6BbPvMe/zS9ekPFh/fg5urgCy2JR/UKEi5QC64H
	 f0YuRUKZ6LvniecZMEWQ/B9mR+bx69Iy+qrYdXY8dG1ZJwIRvacJrf+CczXgc0zwIQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="k356/ka2";
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C1B606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 16:05:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05C1B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k356/ka2
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b546061d58so7682332c88.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 08:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795449948; x=1796054748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=advUGfCdbBqYraOvKgooJOlxekjlOweJjjeGy6AjTKs=;
        b=k356/ka28X3X179AGmcAW6dqarUc/OAG85T9rJcJjF/vKvjtPnst3qBnLM5/lhDE7W
         9X4V4DwwC8iA+/QPbzyK1PFV0m71JT7Umh0dlj5iFhRiNemQS/kncJPlLtYXrm1I616u
         +ir3rJGd0vUZruGin1nIjH67SlkoGjM0gufsBRjtbZFk3DI2QuSw+zL8gbF/ARXq7eC+
         DVXkQz696AH5E2rS94WwnZ69hoAw5gK/GHSZ0fAZ9/PqOnKuGUgkt3XY1+dVZ7I5/gKs
         Fktd1FrIz0GSovtsIJ0F0TbLqVLDR+GcvZFlwNB0ao3tLugHgR1G0GbcxNw/S8uOfA2J
         WEjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795449948; x=1796054748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=advUGfCdbBqYraOvKgooJOlxekjlOweJjjeGy6AjTKs=;
        b=QCGTvY5zuZzpD10QILAYCVitS9GqHzG2lHViTgx2Iug/2Z400yxVt/NcCjlun8PGSb
         Vin513DcWE1TfcluxAVPiwNFRwwcUr8DTgFWe0kFAbhy8+pOWzEq5Rx1qiA0r7X4Ntd8
         gfVjVoxUjF/Ubl7HL5levllExNRnqita2hADq1RUhPYxQV4/i+Qohx9zyaOllpFh+MEW
         Kv9M+EZgG0Pb9YKw9VfhWLkpUT/shCR57NHIorAuCJcSzLtjXO6mvnL3BPlXEaY4o01H
         pZ9t5jApV3HWwdO5Uttd8nHhPCeKT8xJzNHMM7ZATo94R6nxvd6ZvM0s52Fj29zcojKi
         nUew==
X-Gm-Message-State: APuU4Z8P6YUqOxVZsItUKFv4lLLqDDPXAmGWMfiJgW3afG27YgOSF8yr
	hjxn+LMPlrJ0N3euR6uUk/aamgrRFxABR1DWhcCr3mhfDBmFUmT2h2buoROy6RP9
X-Gm-Gg: AZFdTZc/Ozapx4Q0lq+MezG2W+kVU3equVK+C6AhQRkDxNcr53mXCfNgAbn+IOomDax
	CvhzPFhw3CSrdXni+k9Qk2NdKK3IYDWvI1iJim+9zZ3nnIKjo4RG9camLXj+UqtoaOBZUi9Kr3T
	lC2vT3YeuXQrHdzYX3uviXODputmQfuCqywjZBj1KOl4LNQl43i3V9nioNjy28qUg0L1LJZJO+c
	quCKjRAsAYP/l2EGCuqoc5Guu/F2tPNRQbY8Ktom4hnwQ3uqnpR5YhuiYoVj8TSRH/yFPnIti7l
	soFn+az+M8Dp52MDrRLyPWO965II77n3aQ5vlXidQkW2tOjlG6B83H5+dXXig5LPR+VWlkEWv0X
	y8R/zQenuqhdzyg4SrlOjE4w0dP+7dfxkRPg+9CqIZKL4Y33Yd0gnCuwn2UvQqOX+51BQvpXwZH
	7GiXoh4vC7TTwiKCnOOQcYkNG/8vMyXd0jovHwPtt4FXG+xHFslUW41tH8JuaS3ELxmfcJnP0qc
	/RzuvbIwvhBT9QIWLfeCvMRZgGtGLeeKmHjehPvw1rTzbLwOtEgysm+rJ5EVDCSSje83EnH4C9U
	jeE+yIKKzyws8Ca4l5S9xt5r7d8Cs0YLIhI2hXL5XFGgI/fipxwMU+iPlqM6
X-Received: by 2002:a05:701b:2817:b0:1b3:aceb:b8dd with SMTP id a92af1059eb24-1b556911012mr11680791c88.38.1795449947785;
        Mon, 23 Nov 2026 08:05:47 -0800 (PST)
Received: from houminxi ([61.170.225.237])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5568592adsm28501460c88.15.2026.11.23.08.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:05:47 -0800 (PST)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: dev@openvswitch.org,
	aconole@redhat.com,
	echaudro@redhat.com,
	i.maximets@ovn.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	matttbe@kernel.org,
	netdev-bot+sashiko@kernel.org
Subject: Re: [PATCH net v5 2/2] selftests/net/openvswitch: check that a failed set keeps the features
Date: Mon, 23 Nov 2026 11:05:32 -0500
Message-ID: <20261123160532.3227091-1-houminxi@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <179533258159.3135.906610390890565632@kernel.org>
References: <179533258159.3135.906610390890565632@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both nits are taken.

The Reported-by: is on the kernel fix in v6, next to the Link: to your
report, and this patch carries none.

The note in the set-dp branch of main() was wrong about the mechanism.
The kernel rejects the attribute with -EINVAL in two cases, a length of
zero and a length that is not a multiple of four, and the tests use the
first one.  It now says that.

v6 is three patches and follows as its own thread.
