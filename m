Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794911790;
	b=2jbYIeXIrNljkTkBPEVAa6kh2TCHo0sF2Oij3noYXmR4vUGLC4pvJfEdK3k0Z1gZrq8m
	 WZjNHBO8uUaElMf7MNaDMAEXlG6RBvZBHq4KXn3BU8l5vjgUIcbYtOuLGiCtowVIgdV2D
	 8jDfY8BKHLEkasUgHcvaGuX8rTpc5ZnPOR4kU7DzFHYdR7o5PfpFggFdLy99Uxhbsg4Qn
	 psJie9jYHDtKaHlsOJmFlyV202MESluzbXHK8YaERQF4wvmf0akqWGW4NKCIAopzau3vs
	 1+gCP7UCLvENfRCKvM2AskKteVFR3FtdgwAkdGS8R1b0j9KcqdfGfnD5+OzTn2ihlhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794911790;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=dVsMMxnk5C2hLXw6Cp+8gHfJckxJ7C3h8A+Jqq/uxAU=;
	b=bY8hNtb382N1vGo1Thlq4MGLSMcRs1JwKHttNWzSvdzXVb2S91s9/IxejATlDvsxDPEY
	 VBQ+MCoWXpbDY/6KrlrMYCeOGNiz1sIVHkGPXquNo5cCtTmYyqXDpQGCRN7oF5Bcb8krg
	 Omo5ARy9JT1IRCQtd8ruvo5hcTh7CIsVSnWcM2K+VKZd5h0wRKVTyi35qbdEQb2xBvNON
	 /VAByNxm8VpUAnlymYEkeLGTbPBWrde+EjB0F0pyT10pmNeMNe/1OsvleBb6MX5wyP3nb
	 9X+ZEEhF87UtuKYUEzQBNxTh9rvK2sl8CXCcOEvzjj6A6EJfwxdBJR3v9Gb9LEaTWWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z1SpCXml;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2F0606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 10:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE2F0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z1SpCXml
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2efe591a1f6so1236395ad.2
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 02:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794911788; x=1795516588; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dVsMMxnk5C2hLXw6Cp+8gHfJckxJ7C3h8A+Jqq/uxAU=;
        b=Z1SpCXmlYQlLPR8Osm1Ibu44+bpd2wZezOrB/tbGkBrxWRb37aEq9G3cUx/KlkNJce
         7n0kyoHmAKDG1RHOvOaEuyrDGetF8IARZQ7GIqH+YkqnSxpdtLAxJjjA9sX3f+NXuGD0
         SRrWstDUmMqUZuVziQwFYMqfI8CzMmZrftlUESydVlvrW70wnq/VlDml1jcmVOXf01bO
         gSA+PicsO5Uf8gVm3KAswe9l178IwdxwoSXsJ1ByQz9gUArsQWEy3K2pmlXhvVqYJo3T
         vyrgoDNZD7xOQTK6kiVThBlB2/582umMpiWjOct2AM7huOmIyWHWxA4YnHDwQuLFE/mP
         NjaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794911788; x=1795516588;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dVsMMxnk5C2hLXw6Cp+8gHfJckxJ7C3h8A+Jqq/uxAU=;
        b=EVXYhTR582jMBG3mWEImRDjg9vM/tnAKR7I12C1QG6i5P8DrG+h9kSfH7wRjBXAjkm
         upN1MJnA0Qh3EL1InMv3mCeuvgpXOuZUy9UJdkE6YOQfgMJU+In5+mhLQADhohGlgc+/
         ht4IvQLOvoWA/D5G3Wy8WDU+euwI6MmHgi82IUokdXVVsrU7O11RT7IL5sGDqoZqNDNu
         zJeBq+luIBztJFeYCsWiC6vMNgQkJy5dth3u7KjHbnc76e2s6QCTMlFvsoYfsVw+KV3D
         HGtNAPQT7eVnLGLTIRGlewYqgoItmJn4cvXSKGUUlk8H+O7fstP6h5YIzW3LA3A5cvt7
         uJaw==
X-Gm-Message-State: APuU4Z+Zpdm6aQV7tS6a3dOWf+i+sxdE6SNPfyv6Hjlbd67MhheyArFX
	cVAcij27sJ/MdjB/98foYWTE446ZIF5PG3n+rD6uip4vl5x13ygHQOki
X-Gm-Gg: AZFdTZcoJZHZRURevVxH31FlVnppHtuzhrdk8dIFnp24FvKn5kIj2WcEATqAGz6Dd1h
	/MTVh13E2xSLhbLadnD4haKCFziFNLWkcAKhHkt/i6tQcPm5l/zaTkGbtjvx10sCTGCNUDzoOxt
	2aCvoVX2qr2GoJlJtqvUXeAVh9MUBLL6+q8jqhOiu1JtGdVcmZvZXqjbgGZfOMUW7hvvd05dhtQ
	NIQFHqva/6lpJAnO4j3rKU5PLa4JefeKETAFBBJxGECXipcZMJSrcjzC4haZpK1ZO34gXdTTCIv
	7GbPotzkTI2qiJHGKGEcOaFkXo5AcLdD1bk44NYFi9BwgB2Ymnmh6n4ZfkkMH1RMei1+GshEZr/
	PB41h42YhwHAw/C4lOdnK7qIAayEuwKep4bkm768xQCp9nl3aKjPvkLEtnV9UfAEf2ywnnLv6WJ
	EiGjhXzp07IXBNenrlfsgTZUfHrUVcfG3sY8wreja/eX6Tt/edIwjh3ezJ5rUyNzjF7nOkGXAZ7
	GD3O/9x6gvGvb9J+RUJlzGfJqiub11khetA6Hu7YUiOv/ku1Fl4U+vJKtjw1+bM8TbOri95GELZ
	nqQcJlsNLqEbUTt4n/TbuQNWnOXsH8heyVT7H43+iecnGOp5asgZTZTuXpDE3mAKSwdbZirPzFd
	41h6pXngYRgWQxDyEkneCEY6MMhroQPCvUsIcexFonBcy1X3DM3OL+McsM6P3l66gwP6naNZgbn
	CjH/A=
X-Received: by 2002:a17:903:1905:b0:2ed:2176:2452 with SMTP id d9443c01a7336-2ee0da7c0f7mr125573235ad.18.1794911788247;
        Tue, 17 Nov 2026 02:36:28 -0800 (PST)
Received: from [169.254.3.1] ([143.248.188.96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd76d8f08sm13094805ad.4.2026.11.17.02.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:36:27 -0800 (PST)
From: SeungJong Ha <engineer.jjhama@gmail.com>
Subject: [PATCH net-next v3 0/3] rust: net: phy: suspend may run without
 phy_device->lock
Date: Tue, 17 Nov 2026 19:36:18 +0900
Message-Id: <20261117-exp-phy-rs-maybelocked-v3-0-4e183a7366a7@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACIu/GoC/4XOyw6CMBAF0F8hXTumD0qsK//DuOhjgCqvtEggh
 H8XcMPGuLyZuWdmJhGDx0iuyUwCDj76tlmDOCXElropELxbM+GUZ4wxCjh20JUThAi1ngxWrX2
 hA+esVEoJzI0ma7kLmPtxh++kwR4aHHvy+E7i2zzR9pu77ZY+9m2Y9h8Gtjf+nRsYUBCUC2sVl
 RLVrai1r862rfcjAz8y6U+GrwxTOnUukxeTmSOzLMsHd0UN5R8BAAA=
X-Change-ID: 20261110-exp-phy-rs-maybelocked-ddc59993efba
To: FUJITA Tomonori <fujita.tomonori@gmail.com>, 
 Trevor Gross <tmgross@umich.edu>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, SeungJong Ha <engineer.jjhama@gmail.com>
X-Mailer: b4 0.15.2

The Rust PHY abstraction tells every driver callback that PHYLIB holds
`phy_device->lock`, but phy_suspend() calls `suspend` without it, also
right after the state machine drops the lock. This was found while
auditing the SAFETY comments of Rust abstractions against their C
callers, and confirmed with Clang's context analysis [1].

Patch 1 drops `read_mmd`, `write_mmd` and `match_phy_device`, which make
the same claim but are called under other conditions, and have no users.
Patch 2 makes `Device` generic over a lock context and documents when
the `Locked` callbacks run without the lock, and patch 3 gives `suspend`
the `MaybeLocked` one.

No in-tree driver is affected, so if this is not worth doing before
there is a real user, I am happy to drop it.

The audit, the patches and their changelogs were done with an AI coding
assistant (Claude Code, Claude Opus 5.5) and reviewed line by line by
me. Compile-tested only.

[1] https://docs.kernel.org/dev-tools/context-analysis.html

---
Changes in v3:
- Give `suspend` the `MaybeLocked` context, and make `genphy_suspend()`
  available in both contexts (netdev AI review)
- Move `soft_reset` and `genphy_soft_reset()` back to `Locked`, since
  `genphy_soft_reset()` in `MaybeLocked` could race with lock holders
  in `suspend`, and document phy_mii_ioctl() as an existing PHYLIB race
  instead (netdev AI review)
- Drop `match_phy_device` as well (netdev AI review)
- Fix the `get_features`, `soft_reset`, `read_status` and `resume`
  SAFETY comments, and name the context at each `from_raw()` call
- List the exceptions in the `Locked` documentation, including MAC
  drivers that call phy_init_hw() or phy_read_status() directly
- Link to v2: https://lore.kernel.org/r/20261115-exp-phy-rs-maybelocked-v2-0-8fa7897a0352@gmail.com

Changes in v2:
- Keep `&mut self` on the moved methods, so that `match_phy_device` does
  not gain register access (netdev AI review)
- Give only `soft_reset` the `MaybeLocked` context
- Drop `read_mmd` and `write_mmd` instead of leaving them `Locked`
- Document how PHYLIB calls the `Locked` callbacks, and fix the
  `from_raw()`, `phy_id()` and `genphy_soft_reset()` SAFETY comments
- Link to v1: https://lore.kernel.org/r/20261110-exp-phy-rs-maybelocked-v1-0-3023cc9055e9@gmail.com

---
SeungJong Ha (3):
      rust: net: phy: drop unused read_mmd, write_mmd and match_phy_device
      rust: net: phy: make Device generic over a lock context
      rust: net: phy: pass a MaybeLocked device to suspend

 drivers/net/phy/ax88796b_rust.rs |   4 +-
 rust/kernel/net/phy.rs           | 299 +++++++++++++++++----------------------
 rust/kernel/net/phy/reg.rs       |  17 ++-
 3 files changed, 139 insertions(+), 181 deletions(-)
---
base-commit: 7ccc5e05043b1bb84326b19a2b05938d8f7a2ae6
change-id: 20261110-exp-phy-rs-maybelocked-ddc59993efba

Best regards,
--  
SeungJong Ha <engineer.jjhama@gmail.com>

