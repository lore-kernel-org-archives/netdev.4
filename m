Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794725275;
	b=ynt1DwJR9tdZpIgz8iXcQJrlJhR9X7QQvureReJutl35/FnCXAg3e3eTHsW2EjmJgO3q
	 Fco4vVPZu+7baoWogXZH6KWYd8bzDB2hfvNL1so1CmrYjLcGCB0Kc3JQeP6mKlb1w/g4r
	 fklUBj970U0/8eTl0QIcW20YPKDk34QLB9Jrcg5e8rOhEPKahfH6jhS+8Z0OEvdbxVfmy
	 VTu3EbT7xh4Se/j3oQFdG9GUEaQ9ISQT5f7WJhlqqHccFZFmRAYhLCwmMk4OoV050EXFe
	 Wt0p2qI4o9wRoX5/lkfsC9oSNtXxqqCsEmy0tO70zWB3vhr6szoNOMzF/06xo/O/r4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794725275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:Cc:
	 X-Mailer;
	bh=tCOuiXg8kpPxflANatAGCcoqQ3Bqdp5UPGwZfT0KsEg=;
	b=IRecuMGz9VWLXsiFQjd+HWB224qU7qfECBSIGtv+bEkYCtJm0QJ/wIgQhj2GkO9o6P4v
	 fe8l27qob3xC4X3wYC9dJbl66i+fvX7MFEWJEwQ0mOC/nzJI9/djrKos1OF5+lGXoH6b/
	 h6pdZLMJvPQ+7+6KIfNM8gqv2An1YjlE2KJFwRBRaxROiNqaLWeTk39l5d8t31adCrYY3
	 Ot1o9ZvnUi6tgkhkVj1SwHSMAOtMVNCIwgSlUHZM3bW11FwrYjEjGsaFLsaH1B6vljDrJ
	 9IIL2HArlVroCO5sKePXGJE02W+2bK6dItcHmYtSTTysbNbOa7XkPApT0n2uYSvk8EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oJz2hC3C;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10B2606A323
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 06:47:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D10B2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oJz2hC3C
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b15e46698aso2044164a91.3
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 22:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794725274; x=1795330074; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tCOuiXg8kpPxflANatAGCcoqQ3Bqdp5UPGwZfT0KsEg=;
        b=oJz2hC3ClvJrfhKNgz2wQryvBei6eSKNVOTwRwIrluYR/TalqWb8P0ajRdbbki1okt
         7/mhDKKbseYy7ovi8vY5DAOsNoE0GiFVY2PF4YmfAfSb1MdwAEe4I0pvuvF2wEiVQ23i
         5nVELoisMLrVlGv+K6fVFmUiCRv33Zi4GOkvJMqf2Wie7FstaCerZX1Mf6tDYkA5HkUV
         Klr0tccU6VrlHU6rs9XUX05jHZ12cNDMrB7KA0rXj8h6PFghS19tXeJ6I4HsiHuh3ld9
         Y/ZWkdTEZPCJkpvu31RUmCLrgVIquGTCfyM8LWN9sJBR3mT9yVECKwbs9LT6/Sq77jok
         8MUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794725274; x=1795330074;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tCOuiXg8kpPxflANatAGCcoqQ3Bqdp5UPGwZfT0KsEg=;
        b=XPsZzWBZ0YsVlrzJ1nfVfTjGCKXKCIbMNuP1j86uC32VUhcTF2SmV7MtyYQImnbHD6
         YbqImr/mpaF5s0paqesSpiKsprF9Km34U1iGCgWNfhl/6DA9jCyAqfS/cIPuCcf3ezwu
         E/60HUB1GNM1RIQ+QsE6p2Lr57R/E9bfn5aoMJAi7QTpM64oIdP7cgrwvespF0nbpOX8
         LxI4K88sJx69B+2pmKtNRCI2c327Ncu7YTiMmHF7TCThu5eLUQjFr3sg+kv2+Rg6ZW0U
         EXZQFvoZe1zZQpTM3fgVkiuYgdxT00TckJdipKdx1zEgKKwK2fgdAsuRy+TKCb0Y3eU0
         AlXw==
X-Gm-Message-State: APuU4Z+yEmmfi0E0ps1/dyg0/xrIKxW1Xk6XivddwP/IE859YXrXGBLk
	Z+iRcfiIfAjKq30YIZYeAZAWjFdBJOUSZiHLUQ3IxwGBv7IolwJ2UmE7
X-Gm-Gg: AYBFou1Jt39m2IbhWqKtutEIdQTu0JYEu3+wYjGXOqHLaYWUgmadrnnIOILCQNrY0uG
	IHxze1lfKLhQ0ffWz6w1qPyno2DIkk3xbe+Oki1PTRUQJVWRNKxNC7FmXg5XN45syqtCnObNI9z
	aFdhBYJBfX/XSn9Dhqhrc2+iyFVYT+VaFCybdAKW5EtswEzVsY05CPD7HAZV9B5A3pRq2oEq4qe
	WGxMblrlX9K1bmijAxHf2d9fMHJAOltDOjiJSdEf8qMW3zhqIGXkkixGGOl5n+EkUPJN90x5O/H
	4l1D1wzvuRI3OJX3oPOzggOlaH0lSG8vQt0f6qmW9fxeLYfsnVO8ZL/86PrrZgCQlzvP8azcHj3
	G2YjrtwgpjE+TvxT57WC4Pv9NMC/NUosnEIoMITKoyHWkCF2691umb0rBgWmf1GQ9FrBnGRjhME
	e3dcuBKhG25+fo6DLZJNArHVa9NizNLmSDV6vvdbyTqud0F0yZMeWG6SZ/LmrjCJSHzmlDx7lBJ
	/cwudnKYf9aTAFFTGSsYd+wPYwuHIbur+1wjnVAvW1v87rAPAS2FhkUAdxkC9d7B0OWtsJpMGim
	+W2fVpZu5Y8OHdawrQQSnnDn0zAOhdI4Zn8OMus5gft9HEwRZB6I7RfU1bT/vptejeCS/d0qadH
	5YLJusmLaciXBVbX9ljTO9xVkX2s4JnVqXjeKE7AvH9KHl5cqdXHonwTw63Gqwpe8vNJNUt+UqF
	BnaQ==
X-Received: by 2002:a17:90b:54cb:b0:3b0:ac2c:1619 with SMTP id 98e67ed59e1d1-3b1b0a5064cmr6609898a91.39.1794725274127;
        Sat, 14 Nov 2026 22:47:54 -0800 (PST)
Received: from [169.254.3.1] ([143.248.188.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d27d26sm16136309a91.13.2026.11.14.22.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 22:47:53 -0800 (PST)
From: SeungJong Ha <engineer.jjhama@gmail.com>
Subject: [net-next PATCH RESEND v2 0/3] rust: net: phy: soft_reset may run
 without phy_device->lock
Date: Sun, 15 Nov 2026 15:47:35 +0900
Message-Id: <20261115-exp-phy-rs-maybelocked-v2-0-8fa7897a0352@gmail.com>
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
-- 
SeungJong Ha <engineer.jjhama@gmail.com>

