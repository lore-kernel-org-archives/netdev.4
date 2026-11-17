Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794911808;
	b=ODnUdbtxNsHlbNNfikpQUx5TJpluspCCQxBoJw8BUaIDsylA4TAwAG/8hILZhrcdfSXi
	 Q95cl67EZ0sOhF/tkSz+ZbvokoQIuDQeMxyigxovf/50wsdh6MMQIgT1yfPrdRVA/Pms+
	 xG86kBc8CjUHZde6vioO6HJ5YFJzByIJoEMoSS3sqoe/tl8J6mEI82s3JSWJJZsOOW9eS
	 5NzZIZXJQ0ZMHJjynuUNtiauWS5zE6+khbjISSbB2T88fg2U3fNBggHDcAkxSbG3pbAnU
	 xxc28jtjlfqi8T/Uk7w8mW9SH9BW7/atcr7EfP3AYQDex26hJ0bxAE6wVCbQKcHWFGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794911808;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=FioHEqNJVDi9xtkOHwajsyHvSlfk5pWhTzk2dE+ScPU=;
	b=HTKtlgze45p9oGA+LThxjiqKzV4VOEKFuZH8NbeLgOzYe321MzehYEIJsGwgJq+QWaog
	 n70KxhnFPcwNTTxuM3eJQzygVf2TJMUWwXq1xDHAVyq3p/EgcALJw1yRFyzi9vNB8b64i
	 ZuTFIDxZ+QCR3o7xQS564IAYR6Q9RlVxqmbOs0lBF/eWPXbDz7lWo0UCu93lg88OIFVjR
	 Elk1BFOt9EkoBfLmMApVpR8pKXCfxQ00lHBdIQFGYsdKFyxZsN2wHvfUm9qYMsJmitI/A
	 T0bez8ADQZKZekG8k0PYEt9sFEH1yKPnN1MiIcwatppK+fm9LQXEY0VJqRj6kKbEfnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MZAEowsV;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EE5606A89C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 10:36:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86EE5606A89C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MZAEowsV
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cdab8873d9dso2093042a12.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 02:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794911807; x=1795516607; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FioHEqNJVDi9xtkOHwajsyHvSlfk5pWhTzk2dE+ScPU=;
        b=MZAEowsV2cBeyc8Basz0ndJNuq+fSouAbd4BWxc1P2a6tBAdKC+/WD398AcSntUbCN
         oYah99mX5iPPo2+ewqIVO14ewutqJNlxJAbYoPqfa/SbQguZ0oE1W056QRiz/3nzNT0N
         8ttxUNldHTsX7Gdpsk8StnGAY1bHACwxQmfcRQhQTU8UVizyYWC6Hl+J9RUgO49E5Oqw
         XhVW1q6Xh7qj1/SVGANUWY24hiJfdDymL1hmCjK1tL34QW06J6pqIqNntCYyPYQQet59
         Z0xh8eE4DniVFereFmFly6t+PYWS6Mlo6YGrrWE5dDdwH9bdb2qi63dA7ockSpUwtjgg
         Lu2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794911807; x=1795516607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FioHEqNJVDi9xtkOHwajsyHvSlfk5pWhTzk2dE+ScPU=;
        b=ovvPiuSF8ufAdKUoyiBYT73hivc5T01O1v2Jz2PHBW+R+pd8OJuY6vHx9g//BfEpad
         3sCJcd9E/2xXE7RjpP8HT6jaE/Bh4SQUPP2x8J08nilmdWifCYePn0vkmRSQVb6+epWl
         PHbifxWWLg2J7QF/UoSRWfFzxPjSMoGkzroQSMKpFFHBdT4rvZyZX9oYQEpH9yfIWmiq
         VYNroi0efGL+toqpJxU/BHRo3QU1PclYDeHoFcL8Q0as08BVyNloez7UiL+quGeFJaCZ
         rqtY78Fn2OP94L+D8wCixBPzuOD4gkwn6htd8OvrJHWMqTcUFaUcTBEBjvjzsS5vxZn4
         nF2w==
X-Gm-Message-State: APuU4Z8nKQwpCVWCf/lZdMBvRvwovrFKKozam+xwifbM8S3L4wJToyb0
	ML72NVY/O9gmO+Cvh8O1gv0ZgAecb9ul5es9pL4ELc0RasmZ/S8CYLF2
X-Gm-Gg: AZFdTZcevVnat/KirbzCZz6hlzMygEjT42hUUAZsfPoGMs9LAD9rcn9VLp6haAi7ArG
	rCKVorYao58GAAiBzz8FFFvfvAf8koWXRG/ZLdyvrmDyU/d2fkZ/OB8OfkgaXoB+8hud7CJvwcI
	bveK4K/8uOE9HcRlyPJ1aLkkoSNQ+xcuarNwJoVHaFfL8SKnxFlliHNMSVRuxQO1HNcxRq42yAV
	oTUnHc4PizMB5X7+80OoLGDEDGoIoyuydIdhr7Yi9xgDycE3aOFxDn06kWN4EXi19ZL9AHrQgx1
	HnmSPqrhh7DY2ur8vNyHXaFpMnNXLRPPPdGsRj/1T0RUGuaq3GOD4f6SfOjjhrrGL73swUs9Osv
	z+KXHOqRLmG8y6bXGvcfYbkrvI6WGp+RLGwDm07majwcA8rf/D8u7mqkfq3fubGpmII23VWztVF
	ar7OCWvo+CQfM+hvqa62YlN5ObIO5bhImnIdhC619VNwYMNKF2GJV6FEKP7RA27ps2t6ArWubi1
	H1HMQnO9lUqfGg/lj5x9pH/6EJzlRJ0TLPwHG5IgNIeTcDXNphNkcc3JqyS+4pKq8n3To/dFxcJ
	/HewWMN3Euk58cHtEXdN+HyDNSM4T62fDK2aNdYc8fkhZlqjQKc+M7ENWbAamfz8mWhWHq57yOs
	WS/K2vhKNN79sXMGlLh6if0bn04tQT3mwenx3QWH0fpzcjUBf2gne2nzR
X-Received: by 2002:a17:90b:33cc:b0:3b1:2237:3c93 with SMTP id 98e67ed59e1d1-3b1b0a42bd2mr12706368a91.18.1794911806841;
        Tue, 17 Nov 2026 02:36:46 -0800 (PST)
Received: from [169.254.3.1] ([143.248.188.96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd76d8f08sm13094805ad.4.2026.11.17.02.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:36:46 -0800 (PST)
From: SeungJong Ha <engineer.jjhama@gmail.com>
Date: Tue, 17 Nov 2026 19:36:21 +0900
Subject: [PATCH net-next v3 3/3] rust: net: phy: pass a MaybeLocked device
 to suspend
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
Message-Id: <20261117-exp-phy-rs-maybelocked-v3-3-4e183a7366a7@gmail.com>
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

phy_suspend() calls `suspend` without `phy_device->lock`, also right
after the state machine drops it, so another path may hold the lock
meanwhile. Yet the callback gets a `Locked` device, and can call methods
such as set_speed() that rely on the lock.

Pass a `&mut Device<MaybeLocked>` and correct the SAFETY comment. Update
ax88796b_rust, the only user; it only calls genphy_suspend().

Signed-off-by: SeungJong Ha <engineer.jjhama@gmail.com>
---
 drivers/net/phy/ax88796b_rust.rs | 4 ++--
 rust/kernel/net/phy.rs           | 9 ++++-----
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/net/phy/ax88796b_rust.rs b/drivers/net/phy/ax88796b_rust.rs
index 2d24628a4e58..498704f1ef9d 100644
--- a/drivers/net/phy/ax88796b_rust.rs
+++ b/drivers/net/phy/ax88796b_rust.rs
@@ -77,7 +77,7 @@ fn read_status(dev: &mut phy::Device) -> Result<u16> {
         Ok(0)
     }
 
-    fn suspend(dev: &mut phy::Device) -> Result {
+    fn suspend(dev: &mut phy::Device<phy::MaybeLocked>) -> Result {
         dev.genphy_suspend()
     }
 
@@ -107,7 +107,7 @@ impl Driver for PhyAX88772C {
     const NAME: &'static CStr = c"Asix Electronics AX88772C";
     const PHY_DEVICE_ID: DeviceId = DeviceId::new_with_exact_mask(0x003b1881);
 
-    fn suspend(dev: &mut phy::Device) -> Result {
+    fn suspend(dev: &mut phy::Device<phy::MaybeLocked>) -> Result {
         dev.genphy_suspend()
     }
 
diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index 8cbb4c19dac1..4b7b3ad09059 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -395,10 +395,9 @@ impl<T: Driver> Adapter<T> {
     /// `phydev` must be passed by the corresponding callback in `phy_driver`.
     unsafe extern "C" fn suspend_callback(phydev: *mut bindings::phy_device) -> c_int {
         from_result(|| {
-            // SAFETY: The C core code ensures that the accessors on
-            // `Device` are okay to call even though `phy_device->lock`
-            // might not be held.
-            let dev = unsafe { Device::from_raw(phydev) };
+            // SAFETY: `phy_suspend()` does not take `phy_device->lock`, and `phy_state_machine()`
+            // calls it right after dropping the lock. This is the `MaybeLocked` context.
+            let dev = unsafe { Device::<MaybeLocked>::from_raw(phydev) };
             T::suspend(dev)?;
             Ok(0)
         })
@@ -572,7 +571,7 @@ fn read_status(_dev: &mut Device) -> Result<u16> {
     }
 
     /// Suspends the hardware, saving state if needed.
-    fn suspend(_dev: &mut Device) -> Result {
+    fn suspend(_dev: &mut Device<MaybeLocked>) -> Result {
         build_error!(VTABLE_DEFAULT_ERROR)
     }
 

-- 
2.54.0

