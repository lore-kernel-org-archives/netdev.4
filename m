Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794715568;
	b=5Gd5s1o+nIrucZdKkFO2YtiCM4As8kczPovRWYMqB1e5ARU0QytzlI9NHbmEA6tU/DEk
	 QkBE1tNJOLcY1fVg3LpoUURQQ+aByVUCz135LmaEFO9TZq3pAWqrF42EKqSen68RbKvsp
	 resaYVxMWUT9U5wlNlsV79AsSJnriutEUTc9VNjm1mpok/ksvuPEkQ6UPdj53TIszSgNc
	 f1RzC6ftXU3SooQQt0e8JxgX0SFUdFlxR7AeFkXcKoJUeOrIWCevR6EPFxEm3x1fSkZ8r
	 o7+0kxdogo1Bo1OFl02aE4SDPv1vTEamDocX8g6/rGAzhNHCYmNfNXKueNhuhgxhmlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794715568;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iwmdptKo6dk64XoNoPnTXdtm3q1gVmyweOC43Z9ckXs=;
	b=g6FNLsqLKZtJFtkNlcKHxnksN4mNNTg0JzYpGV9HjIsP/UWV/BAsBWc0gJ9LM3EgU2b0
	 sx1Sw3f8DAmU7joiZQignmF5ZI3k0bSiG2cHnKRkr+A7g8AhVip94vtwLWAyjeWFPG5Zk
	 ISPAZfmrldVz4jzfKEx0Ojy8JPCCaICNum818LtmjHDN5BSPQjho6HUmVh++zKquLfumY
	 W0Q46t3cuBxmuzZtpVlna3Y1oyLC4Q2WDd6YYcNvjrLUJ7I5HnbsT7ychyev7QnVexmE2
	 ooB/KumLTq/FPVkKB9jdKmYTV58/sJj8AN/VNyKDvFmaXelV/nF3XdTdALbH4af7hOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x+bSaFel;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B400F606A329
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 04:06:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B400F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x+bSaFel
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b0b3438540so2096420a91.0
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 20:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794715567; x=1795320367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iwmdptKo6dk64XoNoPnTXdtm3q1gVmyweOC43Z9ckXs=;
        b=x+bSaFeldrC3Bz9/GVySpHrjW8YGbrbHij5PaacyHQUQenVhari0VBOnPPKTd7RzT6
         aitq4PXbQGlODQrx6ZGInKjHjgAcQU7zSavKbaANTqrbvREmKDeGHAaIKnPViV/Oduta
         qTJDpKR0O9ipz541Y7VYHBnJIFjU4vlnYzBBV/M8kYFCLctgmd+SzpWU/2Y1kD7cOI8V
         c3aYTnZn0AcvckqU+WczoCWYVaFUjqrPs62yaVkos5rxFjbyhM06stv7Xgqm0eJA6OmO
         6C1fQ67eDPEsGkGf+KVtH2iZABo16il/FMxqkD+UWiySFlcf2CL3gJpCmLl6OuekXhe8
         KwhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794715567; x=1795320367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iwmdptKo6dk64XoNoPnTXdtm3q1gVmyweOC43Z9ckXs=;
        b=zOKW5u8RD9SocE2TYMlow+sRVSHiLImjkJ7qMSxaFK6zWAa0/0YXB9/DtnANeqhRac
         FSgTVDqukaAUcK/8AxAXP/M2/KIpjfHuYLR9J+F3mLXv2ALz8KXwwZlEJRskRj5yy8Bo
         P/FnkZwnuJvvFQF93vyn1oEAjUNWwpLOqWfKwDH3kQzgMqsEhHsu4z/a7YHK0KwgqMaz
         3y3CeWFUGzCYpJ6EKsRDW0uN6CTSgZoEjzsXghBH4B/flnx9C5HwnFDZocOMHpWjVC2d
         6rVbqe2OL1Q6pa69XQ/xfTFR+z45+dMZBPGLnhOzgKy5/0rwwzsSSgbYVZV8CrmNCym+
         Vc7w==
X-Gm-Message-State: APuU4Z9TnN7OET2VZnKSyCU3eEGeUQ4nj/9GYE6w2pXvxzMQY8JzBzbp
	bcjrioW0F0B6TzYTfX3g2fHgdHfiil/7vWfbY1VnjOsG5pxQRZ+mz9fa
X-Gm-Gg: AYBFou0+wl4BxM4m/jnGsKYQKSNnwRywc5A7x7/4KQ0QZHzgK/izjXx8grnGWHwudJl
	yKldtFbjCFC9AciHO0y3Ms11sZVUG85+v7mTHz67/kMMM/k6sP0Yenf2g0TjW38p2XH/v3uAxkn
	hwgWeAJc7DpvvDeufvs7Ria9sS5shD8JUqOuUQAtqrMVQ75gt9gL8T61h19qJntVZwq8troUq9n
	8hnGYBeRqjE+CZ7Vt2FSuhyJzlx+AWseNdSVDXbhkTuT+G90dbM1S2AiGhYPSaj4jXT6Gx2mowf
	Z53c7x2fTl2i9g4199fYnrSv/XMu5RfhTZSQ6+dww6ocuExmax2QjYZOUOkKQKGOStg/Hitq2X3
	Lme+lu5oo6k2EbCyPd3snSZiE/uk7iyjEwT86xFBpzxhTTw6XbHDfIY9Gi+evu1xTRBVwYRBRbK
	tvq0AHs8nEAX+SBcRhXsOyFN0hrK4ErHw94YoyBN9mr7zrDuufRWfrFUTPV0wIDCUbwEEqcv5dW
	Syj3ZOB3076dBCaQzvSVE0Bd/fFoCRw9Hb02DerQBQ6hBalgiCwTgCke90sOn1esP6+QMG038K3
	hzBRvlJWFBowjrIQC/CF5p1CjjB7plmJXGm71ZWWx6TqS3BTafaR7Qetrbw5QQQaVsr53lUzVwn
	16y4NFhjmKtKeyV2OH6Cco+LI
X-Received: by 2002:a17:90b:5647:b0:3ac:b2e6:3181 with SMTP id 98e67ed59e1d1-3b1b0a0eafbmr6641258a91.37.1794715566761;
        Sat, 14 Nov 2026 20:06:06 -0800 (PST)
Received: from localhost.localdomain ([116.88.205.165])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c6c9c5sm15925719a91.1.2026.11.14.20.06.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Nov 2026 20:06:06 -0800 (PST)
From: Zhefu Peng <ilskdw@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	kuniyu@google.com,
	mschiffer@universe-factory.net
Subject: Re: [PATCH net v2] vxlan: reset the remote's dst cache when snooping moves a MAC
Date: Sun, 15 Nov 2026 12:06:00 +0800
Message-ID: <20261115040600.61033-1-ilskdw@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <179470552404.2199510.13614872178874456081@kernel.org>
References: <20261110153020.9635-1-ilskdw@gmail.com> <179470552404.2199510.13614872178874456081@kernel.org>
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
> Can a concurrent transmit still put the old remote's route back into the
> cache after this reset?

Yes, the window exists: a transmit that read the old remote_ip before
the reset and reaches dst_cache_get() in a later jiffy refills the
cache with the old route. vxlan_fdb_replace() and the other tunnel
users that reset the cache after changing parameters have the same
window. Closing it needs a change to how dst_cache tracks freshness,
which is out of scope for this fix. Without the patch every move uses
the stale route; with it only this race does.

> [Severity: Medium]
> Does this overwrite a user-configured egress interface with 0?

Yes, this is a regression, and v4 has the same code. v5 compares
remote_ifindex in the early return only for link-local sources, so
traffic from the remote of an entry with a "via" device takes the early
return and the device stays set. The selftest gets a case for it.

pw-bot: cr
