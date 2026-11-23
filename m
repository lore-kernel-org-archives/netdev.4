Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795460302;
	b=GPA/g/wR1knuLUv0SjaEFDeNSxdaNKzOko43cCR8H6TmSRJAv8Y5UTCXgwOSWFvvpSbs
	 fRwQan+saNZm5n00jVYQpcnMz74mEdVxRZs6B+KD3UcusjtU8dNzxC1h3F18qiHT+qN4A
	 FLXOPrzxCLWUYQX6L7NBNXLexN0WQ99m77h30TKen/4mnvzT6YHqWFVKrj9RDyoBUhcLv
	 qdG4OYDXRUqcUsbh2fS+edYTf24LDPGkPmoCKZ72PIJPtus/0Ter/Y+VSLK6fStKU3Yf/
	 4hYERdShzfJNCld9btqpEYTCESKwmK9ycaLbg6NVV1BUEPfkoAKfbGOcyoPEiynKK/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795460302;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qQMIxscI/2LNyHZOcxmAS+nacwY3kAAmlBeTIs6xu84=;
	b=Nej26rV9SXfuOtlwf9Gizkj60s5RePIl3a77NQ5VD/Xy83oChd3BowtugAlKUQ0YA1KX
	 DGoN6kuOwwPnrV2mplwCGUEey0q6JEBcWuc6ZCNGEFM9mbYH9h0CBsDAUQyJ0m3FcSbZz
	 VlAXJcWzuClR56sO7HXC3aEQXMLC0QI7lWZuduoJApnOUaFSzyFsjtizaXvLlK/Ojp460
	 LnsL3Vv9i0IFRL1KVK2Eqw/7lqxOkpKrB8/g3FxWBjILVK42lVBri+oXAhEzb0LbGxOeA
	 HAQG14ry2/ErTgs0ThqBnZnflIDowYjDyFHqDw0aimobpjpoubR7kxmSAhrJkDg6GAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N8uQQ9zq;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05551606A337
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 18:58:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05551606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N8uQQ9zq
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2f04f61282dso14029815ad.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 10:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795460301; x=1796065101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qQMIxscI/2LNyHZOcxmAS+nacwY3kAAmlBeTIs6xu84=;
        b=N8uQQ9zqCvLqVkvnyvnVbhu+6TV7nHRiuw+8iRBZfCP5sGACm3CbzXAMEwlnKlxL6c
         2sp8gle6z6Nvld8z9gE4YXYb7aPFYU+gEa1ohnkRRMAStkzIuy7V2r/y/K/0J6iB+waH
         mMLs6lZiTKTylnbAJcn6T2nfkY46Uf2w2gEuYFRe0wczJ0CNVU9UT9hISPgInUnORpg1
         2lOGA6HgNYht13HNxkqXa3S5zYgTxigIinQ5XUV//kWjYQuE+d72qZWdXL5sG2KRO18x
         qLggypraDEysFWmyspN1PjVMcw4fHM26RghWTseWkYClowQXphvD5Ag7nq8mdjn7iXhm
         6XnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795460301; x=1796065101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qQMIxscI/2LNyHZOcxmAS+nacwY3kAAmlBeTIs6xu84=;
        b=U1wqdwJpF+ErDNGkzQofifujuHmDygJf2RDbLEiUb7HI163l2btPeG7xRc+VZHZA/5
         63+Wuw+VbBDSuRNWiQxxJyb8APjxRkOdpp5hFxjcO4BTXLheEeXmpEyj13r+U3SGj30f
         FHHYy138BVsGqfJndLyron+WGU1Mdk5uExhNwUFtSfRXsycFovmg3P5B/jxJfaTB8wkM
         V3djaLtc4jjo706rpdDPndabsRK12mOiiRZitHPAor2hr4SUkNCJklUaoDAntPB0RUSV
         s/qtChBJ6tXLA4U8R/TwX6fuTGZeww5GMSXbSzkApJ+4cG3cr6LJtTZGmW/3Gmd6moZI
         YmQg==
X-Gm-Message-State: APuU4Z/LFjT+v+cIzBjmbFViH2LvyrhhMg4Lu7HobNKV1Jua0nsDBRRg
	4FBtWWmo9r6QgP3cofh8evJXCnCTHHk2e7hfDnNfKeez7IBniiq1Mwz8
X-Gm-Gg: AZFdTZftKxEw0GMgBTYCNch/dNbSYvkjV6twSg//95M3tHa+5m+TOr+I8Nz9o3lVG3t
	VvTasiJ82XxqoU0bEktPWO7cDwoAxi2rwVPi3UDFsJYTVS218NCKRgTW7e+uOszMHpz0sXQAJCB
	zcLCZEEhKWbajlEmQ5VZ5Yof66Z8odaULuOVoJhQsnUQD0Hu2jEzJYGyC7gcBn5mPec1QlZOPz2
	RW/sINd/w3t+99+68iPQ0onLMPPGlpCCsJuqqSA3Yb6Aq5zcwBbyD15ZsQ6gjee04r6c7+gQrNk
	HVdzzvxM232rIu6aXDZpfpzyg7TFn9OIAHpjFTEJ1iNGYiTeX9GmkUNArM7+PRqmvnKURdIZFbI
	t3/iwbtPpH4/pXfTrMl3tRqSTyF3CNm79JNXxKnPt1RhWDzyiWomsuUfOlOIEgwwv9344Od++Lt
	j1YbZ0OZHTtamdjLxzGk7u/2EAU50wP8paC2AuU3HWibmC1mhSR3Huo8Jc4Cln7N3lg6HE8EjVP
	OwuN4+BX9NisQtPtLJPQXO1Lyhll8f5mz7tdjlFf0rYwAlG1TBAPUNEpxy0RT0YfjaS6N6dQuPh
	VKDQwHWohuy1NeL7I8Y1Icovvj7LssEx1l7fhvzIhFxFxeBm3odQQ2KL/FkaB3SJnAhxRKhBj9d
	0how7
X-Received: by 2002:a17:90b:2c84:b0:3b4:409:f173 with SMTP id 98e67ed59e1d1-3b41c7b6060mr11582462a91.5.1795460301096;
        Mon, 23 Nov 2026 10:58:21 -0800 (PST)
Received: from localhost.localdomain ([103.248.15.45])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b2156c2sm7758540a91.0.2026.11.23.10.58.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 10:58:20 -0800 (PST)
From: Zhefu Peng <ilskdw@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	kuniyu@google.com,
	mschiffer@universe-factory.net,
	nicolas.dichtel@6wind.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net v6 1/2] vxlan: reset the remote's dst cache when snooping moves a MAC
Date: Tue, 24 Nov 2026 00:58:11 +0600
Message-ID: <20261123185811.53107-1-ilskdw@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <179542917290.3135.7119976710700884013@kernel.org>
References: <20261119095256.42005-2-ilskdw@gmail.com> <179542917290.3135.7119976710700884013@kernel.org>
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

> [Severity: Low]
> Is this check order intended? The lockless path in vxlan_snoop() calls
> vxlan_snoop_same_remote() before the NUD_PERMANENT | NUD_NOARP test. Here
> the static-state test runs first.

No, it should match the fast path. I'll swap the two checks, keeping
the nexthop check first, if there is another revision.

> [Severity: Medium]
> Does this fully close the stale dst_cache window the patch is meant to
> fix?

No. This is the window discussed for v2 and v5:

https://lore.kernel.org/netdev/20261115040600.61033-1-ilskdw@gmail.com/
https://lore.kernel.org/netdev/20261119095246.41685-1-ilskdw@gmail.com/

A transmit that copied the old remote into its key before the reset
can refill the cache in a later jiffy. vxlan_fdb_replace() and the
other dst_cache_reset() users have the same window. Closing it needs a
generation check in the transmit path or replacing the remote through
RCU, which would change vxlan_fdb_replace() as well, so I would rather
propose it separately for net-next. This patch fixes the deterministic
case, where every move keeps the stale route.
