Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794658726;
	b=ceyZq84f0E+jciRoFHq5wTY2w4l0a0IJONaA1aMf2ruclzzx1KZp5AMlX+lBbBchvRT2
	 lh/tJfz6oz0j6UKVGCf9lwB2akXeACD7uH0vMHO7XPDC0G5kfzn2FI6HRa83PFlOOe3c0
	 8OCYPRBEdmb2KiQ3DMrPqBf+Zt0z7DFp53ugB3CZwyj9WbH0NO11/uoIj/L36bUC6lhD9
	 F2+tWe5FcQnZXOAf0mj9iZPzKwBRdbdDa9pyeVycJkE/99cgQ3wlrJeK6FR4I4za9ZHyw
	 PI5NbwCU8/PWy0+vED1LrN1nNbspKk6liMdFlQJP4UgYVwkklvGOWtgEnAgn4+UHhUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794658726;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=8NrM0xFPX4px6sKB2nNjTHnyc3ev7qGMfm1STuc51nU=;
	b=O3MOBNXz/ddFUG4TSA2YZZQKVpqlAuAgQUZdQZcRRgWyzZlTCVjrHA7CqnCA8s7+DK90
	 z5bMdV8Aau8yj+xyzfVQksfShXGEHiobgnOU0+/57U4zjIFWTe72wl29u+m0idaTDf7XO
	 l+zT2c6K066EeY89V92r4F813xLBFrZZXjtz6gWd9n+dhQPnzI1NJEctWXylQ44LdL0YX
	 fDhVmbVcMJ7OiziWvnlqSZ/uF8wJyt00INRHqZYsLx211dlesZUwwqNfT9YdsFpcoEWHx
	 dBjtx4Ha3wYvDXmV5GKUOi01ZZFPUY4LmBKFD4QiTuIg7gfUm4xuR1VvzYTIPOsfcSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=myHe1jKa;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F227C606A330
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 12:18:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F227C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=myHe1jKa
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8b5a6f2f27fso717607b3a.3
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 04:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794658725; x=1795263525; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8NrM0xFPX4px6sKB2nNjTHnyc3ev7qGMfm1STuc51nU=;
        b=myHe1jKawmPJVBFYBlRZoyr12FwQ2uXBiQFKGIDQLzObXAC1i6zVlqBg7D7UC88BA6
         v8XNB+/oX3t9euHqJvEQK/XBkobPxXtJ6T7CbvR79lMscA9yCvuRLPMBtEgCWOvXq3dL
         AjLm8rlI7L88Ju049KX1UcKSpHfuJF3yCpqIdTKFpa11CY1X9AZCYizyAvLCcnL9mSvo
         i4IS0sxNw10sml92RygzlGxkPZjcJ0vL1zsXsLGqWHee+/ciRdqoOwM7yR17zTWPEs9d
         xZdGNukqiiabx25VHjbLENPANUrjW5OISBk6Qi7WZ/5kVTJcIQ+PuWfzvSMuR2sl7x9g
         Ffdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794658725; x=1795263525;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8NrM0xFPX4px6sKB2nNjTHnyc3ev7qGMfm1STuc51nU=;
        b=ggka1qOSKpNYYn3R1xz3jQfZ9popRgSk4gIXG+koYSLIyezOq0ULgu1Dq+khU9W/WR
         /Tg5xsrQsohke1T7YVLNzwYulrVPlFlhoFzRLYlUdMANR0RQJEqeqBFI+F1Ue7mj8GaI
         HlnPpWLXWjWAUAGHABuJQDV2Z+SRuaqKHjWijmi8vIXAq3b6Leww+WwnFbxtATB2IOw2
         vtE4bdLkYIQDRWDmeqtG/vc2x/6FcJQZljAPALpOnCSx/47E2yEWR2pb7KgE2vonnUf7
         kEk8VJYbJNasJHqaj4KkVAL7+GjLe/q/mJZNB0CaidNoJ/IgoXnPo5W2gP5z7APYFVd0
         pF8A==
X-Gm-Message-State: APuU4Z+vekrex3WWB8P7MZ9qyVk6P1iyEbATVbpgk+boaaKFK694aGh5
	FLNseDWVhKwNaGrB0VCEhQMgfjxijH/yU1oMo6VTtogmrPJx3/zw/3ck
X-Gm-Gg: AYBFou0Zf0diO+VMDcjCFgZr6AeOcV0/Rkea5WZpF5p3OCze16DtD6EOW+WmVoNiBER
	Ee/GL19kIfdCtDSkP6/1VFeOufi30lmf9TE+eJDNWqqeHgiWhftYAw4E/qYRdRonMMvnoUI22BD
	F7d4TU7gQAyUTf4n/dOORV74cv7BtP6itID8c+RNndNT9nJWOHIK9vhnj1AcNbiTjChLubChmEU
	3qWrQTQ/Te2nEp01r/MzXPaOf/Ynh1rt/+iu1i4HFCK144siX5RM4wFaSc+DVW69kjKNZJNeFtP
	pP5VNfoahaeGBTB5t5+5i1B2dZ9WkX5ukjtC+cPXh/62y48IdlVUKOtMYyhyYMgpUtzVSg48FiU
	nW8l3dlLcBrhIf28E+WEYwG4NOrOjWrPQKkaE3n2DsViYT494Nbgq9dMv1hVC7fXx/QUmeTxKpB
	hLasibQPt8g2s5ZdOzswBt69s95+ZSyA6RTEaVGwnjWQXp6DRFnfNapabK3FwjHcGifxTgeGn1U
	ru6gcLKOHDhAu3S/2j5IV4klw2AOeSYZ/QE6q/f9ASRwKY7KgeBwP6fKesqG/cRX7DvaTudcJSQ
	GccU0f9090oON+fuMk1BhYcWN6xmXv+94Jdd5/CJY/7aoBukMQRIJcKRdiuITk0lDAFi6AYRY8j
	fwsEvnzPrC6cAEjOs2bKmfZ8xkKUpdUC7VyZxzxKflMF8VpubyTYPclUp
X-Received: by 2002:a05:6a21:66c4:b0:3fa:ab6:387a with SMTP id adf61e73a8af0-3fa0ab63ff3mr129233637.43.1794658725241;
        Sat, 14 Nov 2026 04:18:45 -0800 (PST)
Received: from [169.254.3.1] ([143.248.188.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bececcca19sm2094389b3a.4.2026.11.14.04.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 04:18:44 -0800 (PST)
From: SeungJong Ha <engineer.jjhama@gmail.com>
Subject: [PATCH net-next v2 0/3] rust: net: phy: soft_reset may run without
 phy_device->lock
Date: Sat, 14 Nov 2026 21:18:22 +0900
Message-Id: <20261114-exp-phy-rs-maybelocked-v2-0-19a4dd658b6b@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAI5R+GoC/4WOQQ6DIBREr2L+ur8BjE3oqvdoXCB8lVaBADUa4
 92r9gBdTmbezKyQKFpKcC9WiDTZZL3bhbgUoHvlOkJrdg2CiRvnnCHNAUO/YEw4qqWhwes3GTR
 GV1LKktpGwQ6HSK2dz+InOMroaM5Q/5z0aV6k89F7ZHubso/L+WHiJ/FvbuLIsGSi1FqyqiL56
 EZlh6v2I9Tbtn0B2MjwSdgAAAA=
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

The Rust PHY abstraction tells `soft_reset` that PHYLIB holds
`phy_device->lock`, but phy_init_hw() calls it both with and without the
lock. This was found while auditing the SAFETY comments of Rust
abstractions against their C callers, and confirmed with Clang's context
analysis [1].

Patch 1 drops `read_mmd` and `write_mmd`, which make the same claim, run
under the MDIO bus lock instead, and have no users. Patch 2 makes
`Device` generic over a lock context, and patch 3 gives `soft_reset` the
`MaybeLocked` one.

`match_phy_device` is left as it is. It runs on devices that may be
unbound or bound to another driver, which is a binding question rather
than a locking one; I think it fits better with moving `phy::Device`
onto `device::DeviceContext`, as `pci::Device` does.

No in-tree driver is affected, so if this is not worth doing before
there is a real user, I am happy to drop it.

The audit, the patches and their changelogs were done with an AI coding
assistant (Claude Code, Claude Opus 5.5) and reviewed line by line by
me. Compile-tested only.

Changes in v2:
- Keep `&mut self` on the moved methods, so that `match_phy_device` does
  not gain register access (netdev AI review)
- Give only `soft_reset` the `MaybeLocked` context
- Drop `read_mmd` and `write_mmd` instead of leaving them `Locked`
- Document how PHYLIB calls the `Locked` callbacks, and fix the
  `from_raw()`, `phy_id()` and `genphy_soft_reset()` SAFETY comments
- Link to v1: https://lore.kernel.org/r/20261110-exp-phy-rs-maybelocked-v1-0-3023cc9055e9@gmail.com

[1] https://docs.kernel.org/dev-tools/context-analysis.html

---
Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://patch.msgid.link/20261110-exp-phy-rs-maybelocked-v1-0-3023cc9055e9@gmail.com

---
SeungJong Ha (3):
      rust: net: phy: drop read_mmd and write_mmd from Driver
      rust: net: phy: make Device generic over a lock context
      rust: net: phy: pass a MaybeLocked device to soft_reset

 drivers/net/phy/ax88796b_rust.rs |   8 +-
 rust/kernel/net/phy.rs           | 206 +++++++++++++++++++--------------------
 rust/kernel/net/phy/reg.rs       |  17 ++--
 3 files changed, 112 insertions(+), 119 deletions(-)
---
base-commit: 573af801552999954caa8347e4490b04cf4763f0
change-id: 20261110-exp-phy-rs-maybelocked-ddc59993efba

Best regards,
--  
SeungJong Ha <engineer.jjhama@gmail.com>

