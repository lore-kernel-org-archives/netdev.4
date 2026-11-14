Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794658733;
	b=bhD1kLNNO5SIQg/f4H98DH4Dk3xs2UgFZWNpqPQ/MI0Ch2URsVx9kgGKvyx23e9Z57ik
	 UNQgbnfgTSci/DJToE+oZZ0ZBlokEfiUrOEoQE6JBNkfgeNI/LuZECvRx1wULZUtzPQTH
	 Ex5x7nbzzCrPS8gozDt4DsKG//h9m9jSUj+FnK7N8l58/nIemodRBUSh1Y4jG/PE0Rbql
	 uu4QkQLn363MIc9L/pXJJNyNGQashB3wBVlCqGMS5WOICWoPy8l8yVku/xfanzIzXnXwi
	 xoNunzE0n7U8v1RrtglSf2U2jyQWBj1Fe8nEPZCWynm3F6qW3SsrWA9kEN3TnfKAf6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794658733;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=8aCyDVugFTgDmxcEvIKcJWse+PFQb7Di/86YRfNsvCI=;
	b=HTi4o5roqAABTmG3JRbbB5bGtso7fQfU3uvYaL1wrnOnVbz+VcLQl9x3cATbl08jccPo
	 HQ/JhgEe8fVDfT+zV/ldo7MRh02U5NHFmYFOayvq9Gtqze92KB7tC+hYIg4fe0PvciH8c
	 WYWz/AdRNcovnz/0Mlv7vZmmgEbRsTvKX5aKIT4EhnrXlHZXFwW+zuDD49iiTIAWNXOhu
	 MjV0AF+VieGov8HUra6W7Zy1RkAN9PJZr4lmV+4uuVVisPyCTd842bqI/kKyEcUYfkr/1
	 wCyPncP1W8LuCjh/tLxFkuF6xSrPFYxs7uRLj5TWanHqlEn7GBiWzl3twcyYW6djZcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZY3b4uOS;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C13606A32E
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 12:18:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11C13606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZY3b4uOS
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8b6b22be970so598125b3a.1
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 04:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794658732; x=1795263532; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8aCyDVugFTgDmxcEvIKcJWse+PFQb7Di/86YRfNsvCI=;
        b=ZY3b4uOSYvGz9nNcu1qwN/od2PeKMgIh+NV0BB2dFBwYawl8/E5HP46kuhu8OzpoPD
         o/5jQDYpkp2mxVM95AHfxs8uc2QGWKy05b2DAXCNarRN1SsRPD9z1ptc94kdKlxh5XI4
         KUgJtwKI1ilBrkGWXepRoHRQpMmHxTCkbygrkELMU8ZDF1VnrmV+6qV3z8Rb/XgGnODa
         wxKK9O3jUFhzq6l4+U2DLkwqtzPmfY0KR2y1wCZMr9g2FwcWMAKTHBauFzb340w24Ath
         p5zMobbDqGzUNnBKxRshLt5wR1xDK6rL8oYgFeRnatqTwLxmkWR5fo37gKm9IToyf5Vm
         EF/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794658732; x=1795263532;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8aCyDVugFTgDmxcEvIKcJWse+PFQb7Di/86YRfNsvCI=;
        b=22jbGuMMw2KEJgSCEGIPTLFmjFy9XZ/UnhSLcdZ0ke2G9OYuidhy6O1q0Mh2ntnSDC
         mIhMvPsMxX+fUcDI1C9whzxfm2eUTGe42z1RxHQP6FmTqMbzyiJD0yucKY/TXwNtW7mx
         KPvZ4lWElAufzgn5GlCXqD1dXugjPxM04C+sOJV0EPtnIbdQ2NYDhP7RDWLevM+z5jts
         PP8kvyXinuGcl+CdapRwRSEI5MTHWqAf8VK469KbI5hrEF40Bf0dePNqAVd0m7tWPDj/
         xausp4fBiT6o1IXjuutuBMAZ9Zs3mh4l7IHALsSxrmVME7/oBfCC2prYqn8VmU2CVp4p
         J2Mw==
X-Gm-Message-State: APuU4Z+hp2fPooMnm9+U8+2tjqR3LHQswGz7/CJ3PZSbnWfxM3l+GS7R
	bUxkGWaDWp5N+ImgGAbQy5Ik08kendERNjWhTlaLiWc8837ynFDKflOY
X-Gm-Gg: AYBFou3q8dc187FffrgxmDsmSDedSyLaVgo/ZuzBwIxE80qJViLd4l9T5tZY+i5F0qr
	mT+7lxwrNejFjzD65G4mACt58+/51GiTeNzsrGBJ2KSZ6CNMesvi/63zYLchwOJbLBxbhHuOahj
	X2A1CZihVY0bBQp1p4ML8k+PwAHNJmiFwYDGR0B3X6WrBghCKjSG2PiFgZri10PYh9CMTYmdeMa
	Iqz6jGdOyllTwGbAzN62ABWrrE+RPTgWXpgD3Y5SnhLxdcSjB3iOTlaQp7kUNtdRLV1YZNy+Tmf
	DcQJsl6st1RxGzdBrqQLW4fKGYlaXH+vSApJitHp6R3xgQnwfQAkyqgoPHy6p7A7rCszxvJBl8G
	O++kqxnTH/ITYgMgieZ1bUJopLs0aUXMt8HdesqfqWPi3SsEGbP8eayJ3nvY4rlI5TSkyxwfWXZ
	J0Srv7xLOsTOnO3FEQKyPHEoFbMfFvVECf/u4l7JzJkto2VDsfqWohtfoye+gdNrjMjBVyMNtg3
	+SaYfWOvelMhaVswF6KJzCYft73AgThBo/G5AzjMRO8KrJ2euI3+4nW5GoGMNZFv8isvRH4OgOD
	B3/hj69CGwlzvkuW2cGKer+Cf/k4rdz961wF2jNe2GHZSvcAyL0GjGiusutbpsMor5YzlXSQec4
	GTm4Rf4lTc7nH02f4yjRC+5jPHOzn3C/cQaW1tMvpbw+yS+vz8QYbj+2n387ZBVLfe4wBYeeDBk
	F1Dw==
X-Received: by 2002:a05:6a21:4d17:b0:3f9:a6b6:e173 with SMTP id adf61e73a8af0-3f9a6b6e4b9mr771041637.26.1794658732403;
        Sat, 14 Nov 2026 04:18:52 -0800 (PST)
Received: from [169.254.3.1] ([143.248.188.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bececcca19sm2094389b3a.4.2026.11.14.04.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 04:18:52 -0800 (PST)
From: SeungJong Ha <engineer.jjhama@gmail.com>
Date: Sat, 14 Nov 2026 21:18:23 +0900
Subject: [PATCH net-next v2 1/3] rust: net: phy: drop read_mmd and
 write_mmd from Driver
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
Message-Id: <20261114-exp-phy-rs-maybelocked-v2-1-19a4dd658b6b@gmail.com>
References: <20261114-exp-phy-rs-maybelocked-v2-0-19a4dd658b6b@gmail.com>
In-Reply-To: <20261114-exp-phy-rs-maybelocked-v2-0-19a4dd658b6b@gmail.com>
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

The read_mmd and write_mmd callbacks hand the driver a `&mut Device`
whose SAFETY comment says PHYLIB holds `phy_device->lock`. It does not
have to: __phy_read_mmd() and __phy_write_mmd() call them with the MDIO
bus lock held but not necessarily `phy_device->lock`, e.g. from
phy_read_mmd() in a hwmon read. The register accessors on `Device` take
the bus lock again, so using them there would deadlock.

No Rust driver implements these callbacks, and none has since they were
added with the abstraction. Drop them until there is a user and a way to
express the MDIO bus lock context.

Signed-off-by: SeungJong Ha <engineer.jjhama@gmail.com>
---
 rust/kernel/net/phy.rs | 58 --------------------------------------------------
 1 file changed, 58 deletions(-)

diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index c4e7b1d6c6f4..7ca3f2329e6a 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -417,44 +417,6 @@ impl<T: Driver> Adapter<T> {
         T::match_phy_device(dev).into()
     }
 
-    /// # Safety
-    ///
-    /// `phydev` must be passed by the corresponding callback in `phy_driver`.
-    unsafe extern "C" fn read_mmd_callback(
-        phydev: *mut bindings::phy_device,
-        devnum: i32,
-        regnum: u16,
-    ) -> i32 {
-        from_result(|| {
-            // SAFETY: This callback is called only in contexts
-            // where we hold `phy_device->lock`, so the accessors on
-            // `Device` are okay to call.
-            let dev = unsafe { Device::from_raw(phydev) };
-            // CAST: the C side verifies devnum < 32.
-            let ret = T::read_mmd(dev, devnum as u8, regnum)?;
-            Ok(ret.into())
-        })
-    }
-
-    /// # Safety
-    ///
-    /// `phydev` must be passed by the corresponding callback in `phy_driver`.
-    unsafe extern "C" fn write_mmd_callback(
-        phydev: *mut bindings::phy_device,
-        devnum: i32,
-        regnum: u16,
-        val: u16,
-    ) -> i32 {
-        from_result(|| {
-            // SAFETY: This callback is called only in contexts
-            // where we hold `phy_device->lock`, so the accessors on
-            // `Device` are okay to call.
-            let dev = unsafe { Device::from_raw(phydev) };
-            T::write_mmd(dev, devnum as u8, regnum, val)?;
-            Ok(0)
-        })
-    }
-
     /// # Safety
     ///
     /// `phydev` must be passed by the corresponding callback in `phy_driver`.
@@ -536,16 +498,6 @@ pub const fn create_phy_driver<T: Driver>() -> DriverVTable {
         } else {
             None
         },
-        read_mmd: if T::HAS_READ_MMD {
-            Some(Adapter::<T>::read_mmd_callback)
-        } else {
-            None
-        },
-        write_mmd: if T::HAS_WRITE_MMD {
-            Some(Adapter::<T>::write_mmd_callback)
-        } else {
-            None
-        },
         link_change_notify: if T::HAS_LINK_CHANGE_NOTIFY {
             Some(Adapter::<T>::link_change_notify_callback)
         } else {
@@ -615,16 +567,6 @@ fn resume(_dev: &mut Device) -> Result {
         build_error!(VTABLE_DEFAULT_ERROR)
     }
 
-    /// Overrides the default MMD read function for reading a MMD register.
-    fn read_mmd(_dev: &mut Device, _devnum: u8, _regnum: u16) -> Result<u16> {
-        build_error!(VTABLE_DEFAULT_ERROR)
-    }
-
-    /// Overrides the default MMD write function for writing a MMD register.
-    fn write_mmd(_dev: &mut Device, _devnum: u8, _regnum: u16, _val: u16) -> Result {
-        build_error!(VTABLE_DEFAULT_ERROR)
-    }
-
     /// Callback for notification of link change.
     fn link_change_notify(_dev: &mut Device) {}
 }

-- 
2.54.0

