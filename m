Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795804821;
	b=z5QoA3Cz/KoY1FJe9fDepRgvl9gcsv6Lc6SiYpdQzwMBzkaOrndDMZD1j5VF/sYp/fDX
	 n3OMsIJK2evyJhMQ6IpPGRT76c2hP1Ky3j8/te7VO5g5E4XgGjWQzZO/4ra5Fega56IKg
	 mJ9bKJwEK4a1/r/kTi37vxiDhMnUGy2UZRAmlw/owDYUu3rLp7XbM4OKYGtITFNJ4AUw6
	 m7Mdmp7jgHA80LTWciTFQ4r2oH4YIdSChopSQTK7u6wqPQkJvxPQIKLUI/1ZnvjdSea/1
	 k3CWDXiz+i5Q4ATCITMLMzfEYpdgN7zA/ryU8BEs58EVGGhuB0e/4Cuntq8Bgbdk7hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795804821;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FReDfCXouQxzFDIb46YQ13IWS4CFAwUsjqRtVWzsPCg=;
	b=DvcDBcBjF78GnhBYyFeEKP/kpHyJgoVfUriFRu2Qm7mgLIrSR7/3U7Y40bQdZX4WkNQe
	 i6Q/mv7sHnIno5hkIZZ3kfLzWUof0hboM689zV2aMMg5PLYQZcBxFGTAXMdG5l2LkyFf+
	 IIX5Wvqf7WYd5X09tv1u21gNEqc9ENCmMTkuZQYj4d4ylw2tYxaP6mhd6WqDmmALIF6SB
	 dQ3LWPfVmB79q54MPBzd8h80FKpPvXvncqJc8Nx7mcZXDIgrxm1WgnFmP8MEjuLVPhGq4
	 KxdfTT7ctL/6PeLe0zu6x0ZmtYcGQF00BP34GT6tQWp3BB99fQMuBFEmf+20D77W7xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xljKcLRf;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262AF606A338
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 18:40:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 262AF606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xljKcLRf
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b40d23e1adso5536153a91.0
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 10:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795804820; x=1796409620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FReDfCXouQxzFDIb46YQ13IWS4CFAwUsjqRtVWzsPCg=;
        b=xljKcLRfETg0FA78YTWplcDabZ4wUdzyPDAKfhJGG72f7v2WpaZ2guf6nD92GV/fOr
         9+wzc5VyqgGaNzGJB5sZRdb3O9ynut47+ZzbFUArMpZWBwqONEoFLUCriys53pucG+JP
         sYz/XWIZGNFzkGaDsXReLBAizjV0rYbmtyYUiSIbByibvhGDADrio137j5pzl+mgfmVR
         VQijOT/kYD9CI4ZeVk3e5wSs798eigaO75r2KTZU8PBKZe8e/5FcKHx98mqokD0XIcIx
         2VrcVkVS/dGngIokbfh+16A3haQAP9imgGNOqPPkbEe1ciWwjDhqQjHuiCZ3hKVL8Fei
         3CXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795804820; x=1796409620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FReDfCXouQxzFDIb46YQ13IWS4CFAwUsjqRtVWzsPCg=;
        b=KHqwfCyaCjDvw9pCyU50rblAsSBqtLJ+apI6D4mZai8aJR53wO9IlCJvhQQzU6G71x
         K6m48VP+oUZMmi4PyzKMWwolDGgP/mH5JEKDdYiqY9oazlZPwuP6wE3jHw1yt5/2Gq5N
         9PzozKM6qj+q5BgPx0OqAgjuOkOnHNaCoXm+oio780TRk2HrUO4vdKufmH3+cWjDfK1N
         s0dNPA1SKFw9WX/orTH2uYohoJMC/npSrktosRn/hj7dFY5VyNChcYIHfiwmDCtEvV8g
         YzuqVbPnXbytSWvxPCD0USa5+EWMDws65+T62ooToYyVE9YxjGwU4AhwMMrM2/p6P1Op
         wB9w==
X-Gm-Message-State: APuU4Z8K/ByIGbPg6NAUzX6rZZblX7Pi2yZMZPbPVMFt+Aw4O2aFlkK4
	AG6R6BeLps/RbZUc+iZQciEoXW/mLPfIO+KTA+gcvnhTn7qsSTTmWEii
X-Gm-Gg: AZFdTZcuF15UFlZYfNkaJ3LlhXR9v6Jq8JDKe1V3l94xoqya02Z5GLqNTIg016PPdb5
	mEq7mwZRyQIub9tx9dsRGJ7g0H2FZkI/igRyPqdZiHw9Fbq+/dw4/ens+8ELKwysiY3+Bc0E9ow
	De+i2P5oyz7TXWp9DRDvRISKqbgRL5TRN1uP0Rw0PE897zCnc5bGZNRskeRJJ1x7EAWhI9P7zUQ
	YEPvfUZAnMCUryqSZ34pAe1M/Xn/AI4z67kuCL9OrMu7ip4TEhwJAQFePQzHh1vn/7iwP5uz3zX
	Z/KZblc+/eAqYogYS2aJ9UoULbNDCiRtKnAyzFIT77X0qugOGNkugy9Cw9CggNV4yFE9OVR6F2I
	EpXlzSB6SSerjKR9B0YNIVhYRzcfq5q+dSGTB0V7eFNcugg7ewTOLwfcotbKHoQ7PQCuJBAk8Lh
	h3uneHo9WEe9Hro3iOxejR5xpm0NOFKv/+McbVB+1k191stbklUctbEnB1qzhIFffflXFMzZxk0
	Hf9zrDmQAeqVDewsSBLHim43vgHDBmW/CbeH1pW9K+pCzJOjtS1x62BqQdH6sMfi4YF8d7c01hG
	gSKKV/eQ6MzeZwRUMNk2nhDp7hD1TiAXbTlupMXiC6ppamrumELh16nX9SI2qa9eIp1hNtPYy+I
	cmmlQUA==
X-Received: by 2002:a17:90b:3e81:b0:3ad:6090:a190 with SMTP id 98e67ed59e1d1-3b41c9559f5mr23209610a91.41.1795804820100;
        Fri, 27 Nov 2026 10:40:20 -0800 (PST)
Received: from localhost.localdomain ([203.202.252.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ec698dsm41813902a91.14.2026.11.27.10.40.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 10:40:18 -0800 (PST)
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
	linux-kselftest@vger.kernel.org,
	willemb@google.com
Subject: Re: [PATCH net v7 1/2] vxlan: reset the remote's dst cache when snooping moves a MAC
Date: Sat, 28 Nov 2026 00:40:10 +0600
Message-ID: <20261127184010.74433-1-ilskdw@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <179580399973.3135.12029769847251459361@kernel.org>
References: <20261126182329.91058-2-ilskdw@gmail.com> <179580399973.3135.12029769847251459361@kernel.org>
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

> [Severity: Medium]
> This fixes the deterministic case. Can a route for the previous remote
> still end up in the cache after the migration, though?

Yes, through the same window answered for v2, v5 and v6:

https://lore.kernel.org/netdev/20261123185811.53107-1-ilskdw@gmail.com/

vxlan_fdb_replace() has it too, and closing it needs a different
invalidation scheme, which I would rather propose separately for
net-next. The plain store to remote_ip that a transmit can read while it
is in progress is not new either: vxlan_snoop() has rewritten
remote_ip in place without a lock since before this patch.

(Adding Willem, whom I missed on Cc for the selftest.)
