Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794911795;
	b=g9Te7rDEm9ME14xE77qcuospQ7xEzUA1iXB+G75mEqlUCCTEEPl3dtfR2VCvVemEnEq2
	 DOU5ptZ1CNfTgIc0S6P4WzBDo4el/NUToXj9TqX7UO8pJRcAb11oy/io/5ddZjIxPoECv
	 uQ4uvxZZ+bxxpVDqczJvxLO3WPTL7ywPL7AQnUhQ2xj+MLqzr4KCC1qCnmqf9hw/NxpL5
	 ao6dB/p2yYruWDm38zf0UI1+tc6sPG5tTJvavehN0q6mi11+NQmQ0+QPPLnb0FdA4KmSI
	 CMs6bQcfDnlRdqxFRPMHJt1DLYnBkSh0UT8TdZsKVc7RJ79qI+TsCCPu76/tt9ccXmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794911795;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=qZNTBoTcS5DBWk9MrSUVIyuui63DwibuwP67YeoekqA=;
	b=1cj/amQ0ZCIn8snPh1lH09eqFTm0s0E7qQ9wt7GGaUi1ECKh4346Cd5FpmSSn4Sq5uQ1
	 PGxYoFdJqdo11ZAj39VZEbLlVjLHfWKMKqNEsU+ztS55qGVJ0i8TQR+KQgzYKbxvmREfD
	 Ha6UgO8VxtIcnuOiYaP8SbBNAo/4lktgY5oNrpc1PWeex8cMPW88v/CC/aEX2QsMOd81b
	 pXTLapBj8/S1lT+WYTw8MzGhn/OBvA2bVug5ln2cBB2jSOcprX/cfUpz55clCPiOeN7Et
	 WceXDn713QwuoCW+rhBg2PD6Dlxjn9GOrKThLIJ9l+wDETk4uMng7tOVgvFyP9ZqfXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="mMSZTlR/";
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5737A606A331
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 10:36:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5737A606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mMSZTlR/
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e946155442so45748225ad.3
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 02:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794911795; x=1795516595; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qZNTBoTcS5DBWk9MrSUVIyuui63DwibuwP67YeoekqA=;
        b=mMSZTlR/CC9DhBjsbWp2CdMrIuwQR+QeOA1T2utv9cc8U4/Lss0dk6Qe/qW5DnIPSd
         fNbzVlvQ7ys1Bmg8gMcrphDIZZReZMZ4oXzyRyQctDSX9+51plSTAj0AlximVuQUPOCS
         3JZ0aQlSymrIsJIZr/llhpNEfYP4p5nJKrgw4wGqpsJ5cTVRUALxhlEWKIA77GcD/t6b
         OhYz94YBUB8X9z7UXx+bpxkzo63NOKVUqdl/KG/aGBoDk3vNfaRZH6AJTjCKVPwpKyl5
         jYa7vZ7TY9mlCIEldPNW/e1xEcu87E5xg5hmXdf5fzGqCH8YjShQYUtobirU3A1WzUku
         D18w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794911795; x=1795516595;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qZNTBoTcS5DBWk9MrSUVIyuui63DwibuwP67YeoekqA=;
        b=DNP47gdlTYf1FnGqgu9D9yS6UvhInSNA+eWpYbfLWYvg89ygRzgPaClU/ZQU47L3qd
         r8V3yA3pwt1qBxPlFx28cbmNxTqjpZLK8lCqYBLBJTrjD38SmlrsFjqtPWkwsH18LXMG
         QFp9H+BYdX4dR5/HuWxSfx7zQ5HzS6q9rx1wTfR//hWx8udjDpxN/xZ9ZxRyQOfdEsAs
         Urwao7jdaDWTs2H0B00QQmr85uLBzeA32nVA+90wur/5MJPYOQf/E4+5iCELDMyT6hiX
         uELIuRD/yFctgAppSm5kKDxfH9jSWC8fybw9HequTPo449hY6MxZPQSIQoosuI1ZI2pt
         qwcQ==
X-Gm-Message-State: APuU4Z/ffzkHj/SqZwX35e1JrdoEOCzNcgsjtptQ6dyTv5Xbf2YOo9rJ
	bi6nBDyWM9ZUIEPiFjpCkYc35bwONQSI0ntGo3XZEZd9m+ifw+uJ5b0X
X-Gm-Gg: AZFdTZcLzJK6y5S2VduDGrTVFMAzc+GxDLvevgN4AHRIGef7kYbiKlU+RzLlWZwYWY8
	11AWIiQSREZQTlFEp5pb53o+ZfJBpHEBpLGWELvr3SPP8CXr3Q5Pu0DUYU6nm1TQqNUsQtJzGEV
	KR0SuJAzkq6IQzzWpqSreXiHTMze9YV2kDuzWzhjlC2KmL7UiDbFbU+CLWAp4fYq5iDFicaZfkJ
	PSjaou3BA9XnajwS/R6GghbtFR2zheDjLIYp2KF1bpmqDRFj5hDyzWrhntVWI+GJmyJ2/ySI7tT
	9+b4X3aI03sKfc/qA5O9AVWIkhe8/ZuklPC0cuGYrmCxU80ap5mxOZ23ZVW9cuoTxbGuuSi8qEf
	DKcUgzvipsfEsCgEAhbRCFNaiEHiOKRybouj7ELEv9ub2ciIymGBJAiFK+4nDBLr+U4CTM7FyRj
	06UHig8xnnGko6L5pX/VWmyjsmHRIBvGqBxhQcIdsQasGm+4WHwBRr0bFKSgu/6Zgo9W1rsuO1t
	qP2047+L/6LwElXe+PGHaIw3ZFCWYLt0HE6eZDhY6LRr02J/Gpan6iNDQzFhyjpiebwpB7VswHb
	Cy5W0ke4YJETyoJ8AtHaWUde0LiEGWrnqyldkWkDo2nfBcnofbQmR80/L4zPqcIjE5JlMn2xlyf
	yZ3ja005dicBsWTHEqPbLwvlsbKynG0iq8jLf+i7lktulyn4NRG32Uz0twxft8Sa5+kRz+8uvnU
	S1MQ==
X-Received: by 2002:a17:902:db09:b0:2e2:c995:b00a with SMTP id d9443c01a7336-2ee0dcc3039mr136039595ad.48.1794911794627;
        Tue, 17 Nov 2026 02:36:34 -0800 (PST)
Received: from [169.254.3.1] ([143.248.188.96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd76d8f08sm13094805ad.4.2026.11.17.02.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:36:34 -0800 (PST)
From: SeungJong Ha <engineer.jjhama@gmail.com>
Date: Tue, 17 Nov 2026 19:36:19 +0900
Subject: [PATCH net-next v3 1/3] rust: net: phy: drop unused read_mmd,
 write_mmd and match_phy_device
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
Message-Id: <20261117-exp-phy-rs-maybelocked-v3-1-4e183a7366a7@gmail.com>
References: <20261117-exp-phy-rs-maybelocked-v3-0-4e183a7366a7@gmail.com>
In-Reply-To: <20261117-exp-phy-rs-maybelocked-v3-0-4e183a7366a7@gmail.com>
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

No Rust PHY driver implements read_mmd, write_mmd or match_phy_device,
and none has since they were added. They would also get a `Device` that
assumes `phy_device->lock` is held, but read_mmd and write_mmd run under
the MDIO bus lock, and match_phy_device runs without any PHY lock.

Drop them until there is a user.

Signed-off-by: SeungJong Ha <engineer.jjhama@gmail.com>
---
 rust/kernel/net/phy.rs | 83 --------------------------------------------------
 1 file changed, 83 deletions(-)

diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index c4e7b1d6c6f4..4604a9c0a511 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -403,58 +403,6 @@ impl<T: Driver> Adapter<T> {
         })
     }
 
-    /// # Safety
-    ///
-    /// `phydev` must be passed by the corresponding callback in `phy_driver`.
-    unsafe extern "C" fn match_phy_device_callback(
-        phydev: *mut bindings::phy_device,
-        _phydrv: *const bindings::phy_driver,
-    ) -> c_int {
-        // SAFETY: This callback is called only in contexts
-        // where we hold `phy_device->lock`, so the accessors on
-        // `Device` are okay to call.
-        let dev = unsafe { Device::from_raw(phydev) };
-        T::match_phy_device(dev).into()
-    }
-
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
@@ -511,11 +459,6 @@ pub const fn create_phy_driver<T: Driver>() -> DriverVTable {
         } else {
             None
         },
-        match_phy_device: if T::HAS_MATCH_PHY_DEVICE {
-            Some(Adapter::<T>::match_phy_device_callback)
-        } else {
-            None
-        },
         suspend: if T::HAS_SUSPEND {
             Some(Adapter::<T>::suspend_callback)
         } else {
@@ -536,16 +479,6 @@ pub const fn create_phy_driver<T: Driver>() -> DriverVTable {
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
@@ -588,12 +521,6 @@ fn get_features(_dev: &mut Device) -> Result {
         build_error!(VTABLE_DEFAULT_ERROR)
     }
 
-    /// Returns true if this is a suitable driver for the given phydev.
-    /// If not implemented, matching is based on [`Driver::PHY_DEVICE_ID`].
-    fn match_phy_device(_dev: &Device) -> bool {
-        false
-    }
-
     /// Configures the advertisement and resets auto-negotiation
     /// if auto-negotiation is enabled.
     fn config_aneg(_dev: &mut Device) -> Result {
@@ -615,16 +542,6 @@ fn resume(_dev: &mut Device) -> Result {
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

