Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081974;
	b=rYMAxlLsEXWNyn5Xppy2+BZpjcX1x27idLlRLcXr61XfT29U2851a2XBY3BGTz2l2Gko
	 gCqaqHlxr+QNnQyO7xev4zuXd+k7kiqT26l+nZdApAJaBqPFJ4YZpUWRVyQwXwc2D/VHh
	 98+EQGggjche0N5Eh7+6Ywq26atYiQqS0p0TYwnj75wYrIcqknWLoeg0wREJEaM/hs05y
	 wVMMn6/f5wjh/9R/XXDOGoP6+oguFNRuC2/DtvLbReP3zEz+5CXqWUIS9XOgKxUYbvJyD
	 pgXtERCJ/QLzX4q/4+gNKBrkiPeCvlsrpT/fWROrkjU4NPA4FhT3OUD2lgXPu7Jb9JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081974;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rRr62zld4whCPvLg2c/dz1yTNce2KVNaPHpn280STKA=;
	b=ZnHE1EfYkEt1q0DB7+mA+9Wf5Fl5O9Nzmu+D9eDkH2qICRLzidLPObABC9FOn2GfGz2P
	 leCNqVB7EQuPYfa6VfsMiWDjx0MsRdI7U5YOiF1ufwpLG8ZFhvbulm3mJyz7KWe8yqKt4
	 8C083atUzePPlStUxctDrg7nGDEd7ALHgm+3ZOkwy5qbJFKTbOI1CBdbvzBuanNTh9bIE
	 8NVDocf0oIw6fDSnih/62IZjL7Nrk2XXK7gb2S0e1Cdt1hyMCqn6H6WWjbYQs08Q8+FUG
	 6CHvsLtLkk6oazYPzjSu7z1/OLOSBV2jwvCGXiWJ49nDSzgVqjsy/kM4p6LugdRkdHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=poj8CLoG;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816BA606A324
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 09:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 816BA606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=poj8CLoG
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-380b40312e2so5590375eec.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 01:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795081974; x=1795686774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rRr62zld4whCPvLg2c/dz1yTNce2KVNaPHpn280STKA=;
        b=poj8CLoGc6Zcv0lGpvBks0L+s/fjOnqQEhHPAxqceYQjZ/lx43FNdkBqhXYvzNtBBu
         pkbOqsrvLpNxC8Oj/FrY3Za8H+1BKEZcKVbHYuk5KYHj9g9QAOYSU795s0fnIa9BQym7
         ny1380nctSLuAAC6xVW5SYZ4xWCU35D6n7yo1s6qgm2gHgarNKr3ufngT68+T6WWCgV+
         PgtCbWdYDUiHO12rTcPnwFkEoIh/4PmNXVk2+yxrgeJJj2TbjiLpjGMFJFZlnutFTQFZ
         NgFyQwNkFoNdYjnMgFXZCkxolmHwQZv/80Tapq8kSgfceEFI5w6wS18GIHhI67bQooEL
         bhVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795081974; x=1795686774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rRr62zld4whCPvLg2c/dz1yTNce2KVNaPHpn280STKA=;
        b=AInT6+ncAm8wEmGKewf/bmGl5Jnl55BWXJyA8CSeUtAANva8TrkhEPYljZxourgUXT
         rik3IVOBmKOi16A5RoLoob1ypVZSgB5WgbTd8KQTizUC7ZcBaOTFu+UwXMXShuAE1zS7
         inR//ce3B8+uFfnETLNX11FDhw+tzaygz/QFJqtmUEwf3h7KpWoByHVrJKmU0p7J9K0t
         96IKzkNZRW/y0pRJkIPLpmAfUo6wq6k6rs2z+q4vb/DHJ+JW4kIPng+npEmMdD4yyaaQ
         0WyeLIdT4/Mkv9AaBQs6ETWAnJgpnZcYoSuXO6gq5LSLKFKjKw+LvCwPx7/qSmH9ZPYD
         mjnQ==
X-Gm-Message-State: APuU4Z8Hs+NA8tQM/b04yW+IAHsmQ7Fs02ILrZsh3iEWpj0yXXFe0n9q
	vhUL2jCewkyotzMvMOBJdZMLIoMsUWOb5APlVvFoQxnqQGI53ozijvab
X-Gm-Gg: AZFdTZdC3Pyg5N1JNjoe63B0J/62mfC1Ju2DJ5UaC5Y4IHl2Vy0tEcrbges/ddw0z5Z
	JhAMmsLMjBzEEHD73GY9xG1N1ZkLDUGjF9RUJkolQAVBskAD2zS02IjKME7wFmH+77tsNUiM5jZ
	NoUsxgiFSRhQmSkPHz1Pl0mzEsVUv8AA7qBO5K9ZY5IbIPxNFFTQ/6/hiV41Z2lJt4Gck3tTL1x
	BHI6vbX2iCn/Z45WJkDIM3OyuCjZENZFSUQOnuEOFFjFnmQa6Z5doCGZ1P/vkMjUDY0xrb9SqQS
	q+bMEWr7i0jlqnAXsP65iDTfiAyUMFLqRxhCYqgcQWEz4QEonw1sTbXiu6ixD8pmJDND1ZOMlwT
	tellB9h1TRrXzkPcbaVxTKVRwLtU0B5YJypsHiGKXKfza4ZL/JttD+/Hb7YfSVSCOQlud0O54R6
	DLuCyqhXvkrl6v9pYgpnk192mDeuFWhKEc66IRTmr27KbEdxm9yaOKPygNvU4H/5RB4AhaZqdoM
	BLdpJgUMeuN2t9vXD+kGOv+GDGd8PG0ndN3h+7H8gOEjmc/AjiuTWimFSXR8kOiL1mBppGegOoY
	miM2Dcof6xr4cL2TL+qjwZ23UCH6khwlKwGTgfq0/Vl6o0brbRy04LHw929HdxDI3dim/7oYaQn
	L8V+8IUd2tZHFAz/ZY9gqXXfM
X-Received: by 2002:a05:7300:7487:b0:384:6575:afec with SMTP id 5a478bee46e88-3846575cd77mr1637330eec.12.1795081973354;
        Thu, 19 Nov 2026 01:52:53 -0800 (PST)
Received: from localhost.localdomain ([116.88.205.165])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a80bc19bsm16101464eec.29.2026.11.19.01.52.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Nov 2026 01:52:52 -0800 (PST)
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
Subject: Re: [PATCH net v5 1/2] vxlan: reset the remote's dst cache when snooping moves a MAC
Date: Thu, 19 Nov 2026 17:52:46 +0800
Message-ID: <20261119095246.41685-1-ilskdw@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <179480495432.3136.17109064150958616332@kernel.org>
References: <20261115040609.61134-2-ilskdw@gmail.com> <179480495432.3136.17109064150958616332@kernel.org>
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
> Can a transmitter on another CPU still cache the route to the old remote
> after this reset?

Yes, as answered for v2: dst_cache tracks freshness in jiffies, so a
transmit that built its key before the reset can refill the cache in a
later jiffy. vxlan_fdb_replace() has the same window. Closing it means
replacing the remote, or its dst_cache, through RCU instead of updating
it in place, which would also change vxlan_fdb_replace(). I would
rather do that, if wanted, as a separate net-next change. Without this
patch every move uses the stale route; with it only this race does.

> [Severity: Medium]
> Can concurrent snoops of the same MAC leave remote_ip and remote_ifindex
> inconsistent?

Yes. v6 updates the remote under vxlan->hash_lock and checks the entry
again once the lock is held, so concurrent snoops are serialized with
each other and with vxlan_fdb_replace(). v6 also addresses the three
notes on patch 2.

pw-bot: cr
