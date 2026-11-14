Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794658747;
	b=ZQbs/YlhHrxwELBw+Pu8KnFPzUa23cN7/GwC3/WEvngYkbD28oUA2wPasEX3omHe+PJE
	 eBCufB7EldfaPOtcpXtBHcY9dBxvZf9H6VeWvQveM3IYdaFqE+D7fOJBKxAvGS+vwlsZg
	 AhEjsO2sBKTsPr90dsuRw/FLl8BI9mtl7XKvew2HzC0wVGGj7sXw276F+FdZoIby3pHOi
	 slbvJMx9evAgGm8O6ySKG0MmJF5SMlDERTZaX0m7pm5Nzm7mu/M23e+BOuk+JURe4cBrd
	 Gvo+SMX2x7YM7gDK4zug8atwsQs24MJFKauQkYsIRLrX1IkQT3l+3n8xj5fyLfBsmNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794658747;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=dyenbPZNtGuUfwVU+kdmxfuV+o4Dxas+l3oqGSTufiY=;
	b=Et5o+BK0brFW/Zp0RZMsWj8MdwW7eFxv6iprbSnuEm5xnAYerdFhkUlE8dgnu4xv7WFh
	 hjGtUHWwZuOy0Z3kekBsaxQnhi5e1MGaS3+zxc8irn2Vnzov6o+u0QLY2HMNB1GE4n2EM
	 Kv0RO42OKVQOPH6ccyfD+vjEHGB4kPELRpidSV9/qOEUPjFxV0+09/BEjPEGVO9N734gX
	 x9I71LGVc2AYhx2h3nWORAX7fZ1sZYMgy/BxB5p6HOYldoVqr07OESclSWEZBvdY8oUvw
	 Mn4P/SlORgQXQAa5aj0Tolu7sRlbjaQWWshylIoLjf+af+9QaSD/nQ0LOEs9impKntA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DfAMyMoh;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADE1606A327
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 12:19:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0ADE1606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DfAMyMoh
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8b904d10882so737478b3a.0
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 04:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794658746; x=1795263546; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dyenbPZNtGuUfwVU+kdmxfuV+o4Dxas+l3oqGSTufiY=;
        b=DfAMyMohXe/arlvfBpEO3jQFkGWEHoEWMj+emJl2JFhd082Stg8BljsNPdaxZ7viKf
         LFWvIU9768f4tlulzItmBt7sl7S2vBsI8KI/6Npk9CTu9Vyji+y6kqWRY7srBtt+OaDK
         uivSx7NTvSjkalpZgcDN4Gs9gr5vd4uQUbm82sMWooM26njBFJvNfcySZEyliKQKtTLO
         DDk3i9cvtYd6cA8tn7JQQpLTZ41CexIYfPW4qhM1fqqCtV0KmIU9vNfz6zwC4b8cI2ty
         9RGxRdZNaipxBSFNmEis1ujMxI+XvXN1xCjj/IXxx49vthq0UO7itVtHauZm+kEnVsnN
         WwtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794658746; x=1795263546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dyenbPZNtGuUfwVU+kdmxfuV+o4Dxas+l3oqGSTufiY=;
        b=mwGKqkagSH75C0h32X/LohYD5GWVJK4/by1OsAiReBjusfgjgKpwcGK7iFAyEplUEM
         Ovz6sTiStcFUxK13aFmEap0Yun6IjSqOm6F6nyyD/0OX2lSElccTg41psOLvuT07fodO
         ctglwv1Jqlu7EwLzmtC5p4vJvyRbNHExiifBJoPvfUVxCweNxCrET4tW+oKXvTVAFHjG
         K2lmm8L8s7L4l8IVHB0DSEmML7NTG7AFoNbjWeR1IfhRie2HIGg4GSMHQRzrDpE6QHYw
         Qn/YO+66G0LsIPRZhLwy81Ybq/bu0KeXcBMUYRXr3LCpGiWuO4h7LY1pEIAVwRxrVt4/
         iHhA==
X-Gm-Message-State: APuU4Z9snv35yCTMrjuOV3zAiJb0ZZX5DZCqvD/hZPrsPe3n567rPy0w
	jj0upg/+G5DBKW78vgN/TYsamPsl5/nAoA5o1J0yzaz5MuJ5dDdjV0gj
X-Gm-Gg: AYBFou1GAUa3QCBTJ21n0Js6WIN1325aoCnrJabGHK+Op1f/HS4n/hSEMcCa+bAN1Jp
	34hz0ULgnI0KJcDgwYa5WuLfoFb1ScFsX+/R0tboCcD7c3JLv/5zlo6ucTdDf2m2xU33VS+UkEP
	7Pji6m5J5XMj/D/wRVX+JlJpPLKzpQsPYh+IKEhXOzOqd50dDvI8sKOreWBGKVflgCjyEKJlNIG
	hjmt8PMdNnSv6Zw2KXxLF6b1vUR5eVVB+qfIW3uxgOJ+z95IufC6I/nZMHsZeybkbe4HvBLIx+U
	GBkDVuyF8GtaBG2M/a9xmjvC/Qw1Q3FcsYlhTTeTz6lKY1DPdCk92lWU/LYu1DXOZWzkNBYDkDj
	cdTExXTE7sfpZO2/7E3n3Wx7gu98ovaQdwkcQgJ5/iU3c/WhHv+T/mviM6mHSccN1Hy6terD02o
	bmYAsLVnFaQMcNvvOh1CLXQ7VuLVysZHTFhjjssBenKKYFhZW6y857HzEAbHy3ASd5W0MjDy89V
	LZY347f9Avz+CFIp9bKZTZUsTCeFiOFykYhIWWOErgZtJbkgcTM6kFKu52fq6YtHYmbjmjmlFdj
	iYDFBjg0m3WtRF93H4htB4eqimGBKMNIZ4kQtt0pptaID400wbXm+HaF4JYwvbK6mMz7Qf/Lag0
	ZgdQ+TaiWb3dE3DobT4ZbxNudE/V6J7AjKDrz7PaRvcGm/jiwi5eAMTUx
X-Received: by 2002:a05:6a00:e18:b0:89e:3742:3e16 with SMTP id d2e1a72fcca58-8beb57c3e8amr4969876b3a.18.1794658746438;
        Sat, 14 Nov 2026 04:19:06 -0800 (PST)
Received: from [169.254.3.1] ([143.248.188.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bececcca19sm2094389b3a.4.2026.11.14.04.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 04:19:05 -0800 (PST)
From: SeungJong Ha <engineer.jjhama@gmail.com>
Date: Sat, 14 Nov 2026 21:18:25 +0900
Subject: [PATCH net-next v2 3/3] rust: net: phy: pass a MaybeLocked device
 to soft_reset
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
Message-Id: <20261114-exp-phy-rs-maybelocked-v2-3-19a4dd658b6b@gmail.com>
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

phy_init_hw() calls `soft_reset` both with and without
`phy_device->lock`, but `soft_reset_callback` hands the driver a
`Locked` device and its SAFETY comment says the lock is held.

Pass a `&mut Device<MaybeLocked>` instead and correct the SAFETY
comment. Update ax88796b_rust, the only implementation.

Signed-off-by: SeungJong Ha <engineer.jjhama@gmail.com>
---
 drivers/net/phy/ax88796b_rust.rs | 8 ++++----
 rust/kernel/net/phy.rs           | 7 +++----
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/net/phy/ax88796b_rust.rs b/drivers/net/phy/ax88796b_rust.rs
index 2d24628a4e58..88e6e3c88b44 100644
--- a/drivers/net/phy/ax88796b_rust.rs
+++ b/drivers/net/phy/ax88796b_rust.rs
@@ -30,7 +30,7 @@
 // BMCR_RESET bit and poll for the reset bit to be cleared.
 // Toggle BMCR_RESET bit off to accommodate broken AX8796B PHY implementation
 // such as used on the Individual Computers' X-Surf 100 Zorro card.
-fn asix_soft_reset(dev: &mut phy::Device) -> Result {
+fn asix_soft_reset(dev: &mut phy::Device<phy::MaybeLocked>) -> Result {
     dev.write(C22::BMCR, 0)?;
     dev.genphy_soft_reset()
 }
@@ -85,7 +85,7 @@ fn resume(dev: &mut phy::Device) -> Result {
         dev.genphy_resume()
     }
 
-    fn soft_reset(dev: &mut phy::Device) -> Result {
+    fn soft_reset(dev: &mut phy::Device<phy::MaybeLocked>) -> Result {
         asix_soft_reset(dev)
     }
 
@@ -115,7 +115,7 @@ fn resume(dev: &mut phy::Device) -> Result {
         dev.genphy_resume()
     }
 
-    fn soft_reset(dev: &mut phy::Device) -> Result {
+    fn soft_reset(dev: &mut phy::Device<phy::MaybeLocked>) -> Result {
         asix_soft_reset(dev)
     }
 }
@@ -127,7 +127,7 @@ impl Driver for PhyAX88796B {
     const NAME: &'static CStr = c"Asix Electronics AX88796B";
     const PHY_DEVICE_ID: DeviceId = DeviceId::new_with_model_mask(0x003b1841);
 
-    fn soft_reset(dev: &mut phy::Device) -> Result {
+    fn soft_reset(dev: &mut phy::Device<phy::MaybeLocked>) -> Result {
         asix_soft_reset(dev)
     }
 }
diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index 105a1b727a08..46602798e8ac 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -358,9 +358,8 @@ impl<T: Driver> Adapter<T> {
     /// `phydev` must be passed by the corresponding callback in `phy_driver`.
     unsafe extern "C" fn soft_reset_callback(phydev: *mut bindings::phy_device) -> c_int {
         from_result(|| {
-            // SAFETY: This callback is called only in contexts
-            // where we hold `phy_device->lock`, so the accessors on
-            // `Device` are okay to call.
+            // SAFETY: `phydev` is valid for the callback. `phy_init_hw()` calls `soft_reset` both
+            // with and without `phy_device->lock`, which is the `MaybeLocked` context.
             let dev = unsafe { Device::from_raw(phydev) };
             T::soft_reset(dev)?;
             Ok(0)
@@ -575,7 +574,7 @@ pub trait Driver {
     const PHY_DEVICE_ID: DeviceId = DeviceId::new_with_custom_mask(0, 0);
 
     /// Issues a PHY software reset.
-    fn soft_reset(_dev: &mut Device) -> Result {
+    fn soft_reset(_dev: &mut Device<MaybeLocked>) -> Result {
         build_error!(VTABLE_DEFAULT_ERROR)
     }
 

-- 
2.54.0

