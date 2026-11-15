Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794725295;
	b=fqlxIjcb0NXIi3zPYCfdGzNpPspfuSPnah4/XGBFSLkKc1wb14INjaFPsJpmrWlDHB8T
	 T0Et8Ieka6kmPIX+0jTf8zeFWhsqZ+fVLan6s25F6akMvl1JHHpuF/1sTDQtzxneQPynJ
	 +dRW4zMXRlH7/ZfOCu6eYI1QJjMs8na1P4w5kLBlV6FBnsV6aps5W2HYw9PzfFT64Utmh
	 xi1Do06ARmUFtBjhwTuLxt5rLw1Er3fVNNaZpeg7KFdmtdWxhTr9cFF8mIV+rsayleEvn
	 xREIM4XRyeqT7jwMInZeoIU/aRPJXG3yzNpTDhsyyWOCbHnfnp60eE6kzwyPiBStGcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794725295;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=dyenbPZNtGuUfwVU+kdmxfuV+o4Dxas+l3oqGSTufiY=;
	b=q+HIepLPlfqeux9V6RhRIldK/uPiPMxMkF1oRaD4DuRsp+7Dq3mItvskThu/Wmo7HFym
	 amRSoSMEobXaQ4oHmmL5zOdnjtnejG/ZsjemIjvayzd+pN58OmDmYlqZOAyv99blVD1xE
	 3USC3SptRc9FmzRRqkIf55KcAEe1LsbIjuzfMrf1I5eQzjjF7i5wN06/foPjxs62O575+
	 2OTEbEA5ksjFG9xlAqUwTO9LuKuy9EqHEdBWa2RWmcXhMRu91JE/iXpb9PQa16CeGeKOr
	 qZu+urM+GjI/m/5imbG75+CFGmI6/t0ydAk85uyz6oI8oaocVVHMWO3VKJxk4GxWmzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="k/WRPb0z";
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461E7606A32C
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 06:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 461E7606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k/WRPb0z
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b10ca4e3f9so1206206a91.0
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 22:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794725294; x=1795330094; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dyenbPZNtGuUfwVU+kdmxfuV+o4Dxas+l3oqGSTufiY=;
        b=k/WRPb0zHWBZf1QiP72VaQpemhqNKerApg2KK1po+DTMJKAcfP6CVsyjWUXKiWkqWS
         oYl4wtKoQPLWlq+UIhnicENs1ZanTCxO6GcThB7fUwj0sIvEFY7UIzwkM4bxPxqU1tgp
         1ZieLik0fruRBHQiCVEJc3ORgY3XjuqNSobx6OKZdDlWym74jUPegxFqHvkWatwi8xRn
         Q+SJhGnCU05I3iu84fHcEapWJwda9STXKJbe7+szKx6DmW38cvPU7+l0yk3A8LXxP46T
         ARzhyW+IPmYxxCnZ2+PHMVAjWvHuq0jK2HgC5J3xVwg55pxXD9EkL/CeXF9+35leSOZ5
         u6gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794725294; x=1795330094;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dyenbPZNtGuUfwVU+kdmxfuV+o4Dxas+l3oqGSTufiY=;
        b=m+USq7VprkCk5vdVfhHs39fzhiAX9U2ed75WbZwcmzV/Ussb+x/nnFSRipKTkM740O
         30BEPVSmZNQ97zNSGh4MiZm8uMds/ZsP0NyPcp3f5vUaA1ALeblyiJpoz1gAkxYX03uE
         mzs85LM+WFkoJpexrUXeQOoOKHLmE2TaHuuHORjyGBAYgHHUW4cyl9B5/LGZ/1uRoft6
         RTrHQP2j7x0/GV8TgPyhdVN1LUl85jeC0GFGIBWSXoyZ2vYoVJ/Zm0PBVjsQ4faMTKxX
         4HL3ouq5cqEFSA0/Py3uPhBAc/4HH9j+UDPfTwY58eKLVP0D22kg/EJew0xuLFqEsH+p
         PRSA==
X-Gm-Message-State: APuU4Z8WTccfzraYUxGVIiBajqpkKG8UvLwS7cw7Ca9UU6t3DR8UcAnO
	TBQ7MRqxD2nsV89ZuF4a1dUnPBtG6DQ6xIhcu91Cn2O2HwKUfMfjqQAa
X-Gm-Gg: AYBFou3R2B1b4JjKy2qIg0vRmNfu4MhVImnyPD1bWcdua4LfYrlhsK8V1c5KcQm6OYJ
	UcE22qDt6cbEhT4tCqe5FPGV8soUnzaXipiMqV6/9fXby9oVFYjE/2BFeWJ36b+5bmEATEQXWKN
	g69w0k9DAecSEKFoqwAhp7XOWyqsicKhOb3PzfS1tHUx4K7Db4f6Bi/8UOk6KEuU7U5BQWt80OA
	R7+mKM1XqjvdHJ4NHrEH6BuaXODmckpirTlaetgr77jRsqM/w+Vu6jQH4XNnG5drOCeAj4sT685
	93yNxAguVintxhqH9ngBtB2EIp0/95VreXFPvuvhPjNG11mVBGpJpQRoZcaKoKZ+RkmsXyxW6yV
	knqiagm1XzHlaTmISfQSB99YIR66kMyJuCfEoZ1uqHK0qbif9g8LEefeXwPLh3AbioWWSFL9NwL
	bxM7Mq7bzowe8sxh3HCQ6tF7kikKtsAlS/1mp6IWH2LfI5kPUcGE+t8CtTmM6ma+WvdX7JAODv/
	/8ewhJRkNlXdg+7zUxO4EAOLfbabs9+P8gWofSRtkRBOjKdsuZ7qDeR0dZb2qn1sjPJCz/FcKcy
	gHXY6ALXSkDqDL7CUxzMndfbPhyWwsurOrqvJE5zrKJSoRSMt94JsgS+48YxEnYOVCUDyA3bg9K
	ZzlqDX47S5SHD4HCkdP1lZunWn7pWCANHgdFtaXPwgQVTUK3rabKMW74o
X-Received: by 2002:a17:90b:3806:b0:3a8:f70f:2437 with SMTP id 98e67ed59e1d1-3b1b0b53ad8mr6483603a91.50.1794725294505;
        Sat, 14 Nov 2026 22:48:14 -0800 (PST)
Received: from [169.254.3.1] ([143.248.188.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d27d26sm16136309a91.13.2026.11.14.22.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 22:48:14 -0800 (PST)
From: SeungJong Ha <engineer.jjhama@gmail.com>
Date: Sun, 15 Nov 2026 15:47:38 +0900
Subject: [PATCH RESEND net-next v2 3/3] rust: net: phy: pass a MaybeLocked
 device to soft_reset
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
Message-Id: <20261115-exp-phy-rs-maybelocked-v2-3-8fa7897a0352@gmail.com>
References: <20261115-exp-phy-rs-maybelocked-v2-0-8fa7897a0352@gmail.com>
In-Reply-To: <20261115-exp-phy-rs-maybelocked-v2-0-8fa7897a0352@gmail.com>
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

