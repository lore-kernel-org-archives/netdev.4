Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702142;
	b=Sy5K6fY8q1YOuOOKTMiXrpJe3ykbOB1r2dsAWRzdqm1DYAHht9EEZeoEaYhxxvt0FqfB
	 1wcDOGxK9R/1NzVz92fv9eQqMwRf3ST7aCAAt5EJzAlou7fGbvryRf3QslSLzbrskVty8
	 DOtFu/RBIKMuvrEhwyiQFW9PGANo2YNGaQ6DVwKQvLNBCFAiHDpSHvqgqPBPnrI9S8mfI
	 Nvj1D5Bf/aLAFpHg16FLWQF1AxZ6m0jyHwq8RjlMy5yolqSE/wwRF67FPtjYpa1DzTBa+
	 Pc6OYkQfnquB3p6R8u680UVvwO00CAZy3P2X/pEW2OxWjm2Rcl+h+16F//C56Q3ZvUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702142;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=GA3jjErzEYnxoF7n+/ic3y3L8vij59KVAFVMuR5dBb0=;
	b=MxqOVo51S/B+SUH+nfdKlaL+NoYJrNlaQO52raSo8tfdV46y1TdsFNn87JonBTkq/bGw
	 lZXf37H2yVpIOWmmcywaKzR68E0H4tX0/+kMsnmCmSCqmHVsZZ+WAydON3BQ93Frfvu2c
	 nZCNj1ykORYUF7R4qqadBuRD1D/K/uqAswFedOFEfDCoR7thnKCKrUFkb8msfBx/AneVY
	 ZG3Wquh+/5fpnHHHwetHzOSdQZYJGhcMPOU2USxlR02xh5YP2AFPwh0B5n202vwpJjSf8
	 AhzVFYdFWjuXQT58J/ZqjRACA7hTYbYWLr0jIqiHluo/jnI3TXPL29R5+D6+hBchNpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TxII5QHD;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8D6606A326
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 14:09:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD8D6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TxII5QHD
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b40d23e1adso4735893a91.0
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 06:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795702141; x=1796306941; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GA3jjErzEYnxoF7n+/ic3y3L8vij59KVAFVMuR5dBb0=;
        b=TxII5QHDK0stzogCWbY6gZRZufXl35OTuDpxw8Ei5/BTICnIyJeVN2pNrofOI0JQ/d
         eXojWIsRKkk+MIoB/gnbwAXUKmFwjLdAZH2IslSvzLOorzJwc3nx2BkxBL9RJgg24SkU
         6pk7zNog4reBcKWBEIhJO2VZmd4kcRb/K+X53r2VDfdtsapON3zyscxse62lpH7G5aLl
         wfcGZg0wbhIXLZ83UA2RRwaZ5cOhbPA4tYQ7/1r9cC7mV5lC6EqAXcqzLgFCHn1RQZ26
         POFN3Y84efXf95FDl8F48Ptlw28oy7XwowN/qgsG5fvGkU4dHco/ScRs6z9ZpQMfTmqP
         BEwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795702141; x=1796306941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GA3jjErzEYnxoF7n+/ic3y3L8vij59KVAFVMuR5dBb0=;
        b=OMWW6mVQSe3Zv3kV3Ve+oowteKZpfpSkzT8TZQNnLXgrRMthJ2CxQJGPaIFpT4xyCj
         2b9HZSpY0z+YGbvHiHji8xUPhvnNsLdOt8RM/owlS8R9fnFa9hCRCU/Vsd+hMm4qUSGL
         h59J9K9Hc3eCm9cu69h9xQ4nm0/W9H+OlQDCq+QzGpSYio0OzL1lK+prPHHWXDX4ScEc
         DXzHC7CJw15BIbzvQ4QzY82Zn+NNPANWlfeaYALnXxpxuqc/GjeUXcUuQh2tdL38kLR8
         3tTJPQkHKwp2wn554Fee0fICcdVvRfvEILZUkE68fskBfO02yE8xmjmfe/+R2B3shEAQ
         oMZw==
X-Gm-Message-State: APuU4Z8+dyPkKl4Mu0CX4Ydq6VbRpwali04Xm8AehrhD/Pj5vACzNT3R
	kfazhFHgu9SytUpOBX0uWUhrPuhepToXBIHdRkqhYjQu0feOkjV8gwFQ
X-Gm-Gg: AZFdTZdAgtpYbAnAXiiVFaRIYPtkat3bFdRjdD02ziCKdFpTox4HihNla4uJFPNdHBF
	h6mSVLDdWiOlVff1tWRpoQarClGLr9CK4T4JFqvNzN+2a296+ZZ52HWLPDpVFgB5nqvBE/KkPCV
	SCs1tZ8FtD5RjJ5W5IZahRee8pA+0P7Er3Poj8s2IK3k0eo04F82PyY4A42ceyMmmCmj+YqPxfc
	jlEZUWAa6DLV4vpa7NdyVGe6IOTX2MtjHX1x28D/ExnEoGVr3N+SC9qOl3V8en7q7gkKpbtYTFQ
	jPvC+jIRFCTlS8wsWm7s9LZAPmF2EAAEikEYAcQfmzrFfBZ1DYg5Fufp80Wa8OtO5e6q39dLDNA
	P9FDj6mMJZht1OsRP3//1xbGSCWK4oVZQeqtPQGIeqglcsimoB6u76V5kyDLz/okOkrC5F6q1Aw
	CU9FMMsjsOlhf3cuplrs0+WG5nWWFDURHH+/c9nl5WNWOJ9pLxyOv5xwIqHVWjGeTgZdhvtN7QN
	oj+XWn8SMGOWVlP5XY7z0Tzx5vmnrxObp+8eFRSERwXorGxXKOxSHhkm/p1k4tOOb3khlgbvX+x
	+Q28l6nDU72uz046egsRVAYe1j1S9vfLOyE5MhttDCPfNuF5ex5EgPAVfrYBhTuMWp+YJzkQc9k
	DF9mynYBCzyd2VrsfKRbbTHC4juOe/ldz3tuAEPFV/55bzxO2DzlLedV+
X-Received: by 2002:a17:90b:4a92:b0:3b3:fd13:683a with SMTP id 98e67ed59e1d1-3b41c995b82mr20643205a91.59.1795702140978;
        Thu, 26 Nov 2026 06:09:00 -0800 (PST)
Received: from [169.254.3.1] ([143.248.188.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b8733e6sm12583573a91.3.2026.11.26.06.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:09:00 -0800 (PST)
From: SeungJong Ha <engineer.jjhama@gmail.com>
Date: Thu, 26 Nov 2026 23:08:33 +0900
Subject: [PATCH net-next v4 2/2] rust: net: phy: pass &Device to suspend,
 read_mmd and write_mmd
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
Message-Id: <20261126-exp-phy-rs-maybelocked-v4-2-16f9a10bb579@gmail.com>
References: <20261126-exp-phy-rs-maybelocked-v4-0-16f9a10bb579@gmail.com>
In-Reply-To: <20261126-exp-phy-rs-maybelocked-v4-0-16f9a10bb579@gmail.com>
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
after the state machine drops it, and __phy_read_mmd() and
__phy_write_mmd() call `read_mmd` and `write_mmd` with the MDIO bus lock
held but not necessarily `phy_device->lock`. Yet these callbacks get a
`&mut Device` and can call methods such as set_speed() that rely on the
lock.

Pass a `&Device` instead, and document that read() and write() deadlock
in `read_mmd` and `write_mmd`. Update ax88796b_rust, the only user of
`suspend`; it only calls genphy_suspend().

Suggested-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Signed-off-by: SeungJong Ha <engineer.jjhama@gmail.com>
---
 drivers/net/phy/ax88796b_rust.rs |  4 ++--
 rust/kernel/net/phy.rs           | 36 +++++++++++++++++++++---------------
 2 files changed, 23 insertions(+), 17 deletions(-)

diff --git a/drivers/net/phy/ax88796b_rust.rs b/drivers/net/phy/ax88796b_rust.rs
index 2d24628a4e58..890ae79d8561 100644
--- a/drivers/net/phy/ax88796b_rust.rs
+++ b/drivers/net/phy/ax88796b_rust.rs
@@ -77,7 +77,7 @@ fn read_status(dev: &mut phy::Device) -> Result<u16> {
         Ok(0)
     }
 
-    fn suspend(dev: &mut phy::Device) -> Result {
+    fn suspend(dev: &phy::Device) -> Result {
         dev.genphy_suspend()
     }
 
@@ -107,7 +107,7 @@ impl Driver for PhyAX88772C {
     const NAME: &'static CStr = c"Asix Electronics AX88772C";
     const PHY_DEVICE_ID: DeviceId = DeviceId::new_with_exact_mask(0x003b1881);
 
-    fn suspend(dev: &mut phy::Device) -> Result {
+    fn suspend(dev: &phy::Device) -> Result {
         dev.genphy_suspend()
     }
 
diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index bb2cc6b3c94c..d04a651ae62b 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -371,10 +371,10 @@ impl<T: Driver> Adapter<T> {
     /// `phydev` must be passed by the corresponding callback in `phy_driver`.
     unsafe extern "C" fn suspend_callback(phydev: *mut bindings::phy_device) -> c_int {
         from_result(|| {
-            // SAFETY: The C core code ensures that the accessors on
-            // `Device` are okay to call even though `phy_device->lock`
-            // might not be held.
-            let dev = unsafe { Device::from_raw_mut(phydev) };
+            // SAFETY: `phydev` is valid for the duration of the callback. `phy_suspend()` does not
+            // take `phy_device->lock`, and `phy_state_machine()` calls it right after dropping the
+            // lock, so this gets a `&Device`.
+            let dev = unsafe { Device::from_raw(phydev) };
             T::suspend(dev)?;
             Ok(0)
         })
@@ -439,10 +439,10 @@ impl<T: Driver> Adapter<T> {
         regnum: u16,
     ) -> i32 {
         from_result(|| {
-            // SAFETY: This callback is called only in contexts
-            // where we hold `phy_device->lock`, so the accessors on
-            // `Device` are okay to call.
-            let dev = unsafe { Device::from_raw_mut(phydev) };
+            // SAFETY: `phydev` is valid for the duration of the callback. PHYLIB calls this with
+            // the MDIO bus lock held but not necessarily `phy_device->lock`, so this gets a
+            // `&Device`.
+            let dev = unsafe { Device::from_raw(phydev) };
             // CAST: the C side verifies devnum < 32.
             let ret = T::read_mmd(dev, devnum as u8, regnum)?;
             Ok(ret.into())
@@ -459,10 +459,10 @@ impl<T: Driver> Adapter<T> {
         val: u16,
     ) -> i32 {
         from_result(|| {
-            // SAFETY: This callback is called only in contexts
-            // where we hold `phy_device->lock`, so the accessors on
-            // `Device` are okay to call.
-            let dev = unsafe { Device::from_raw_mut(phydev) };
+            // SAFETY: `phydev` is valid for the duration of the callback. PHYLIB calls this with
+            // the MDIO bus lock held but not necessarily `phy_device->lock`, so this gets a
+            // `&Device`.
+            let dev = unsafe { Device::from_raw(phydev) };
             T::write_mmd(dev, devnum as u8, regnum, val)?;
             Ok(0)
         })
@@ -617,7 +617,7 @@ fn read_status(_dev: &mut Device) -> Result<u16> {
     }
 
     /// Suspends the hardware, saving state if needed.
-    fn suspend(_dev: &mut Device) -> Result {
+    fn suspend(_dev: &Device) -> Result {
         build_error!(VTABLE_DEFAULT_ERROR)
     }
 
@@ -627,12 +627,18 @@ fn resume(_dev: &mut Device) -> Result {
     }
 
     /// Overrides the default MMD read function for reading a MMD register.
-    fn read_mmd(_dev: &mut Device, _devnum: u8, _regnum: u16) -> Result<u16> {
+    ///
+    /// PHYLIB calls this with the MDIO bus lock held, so calling [`Device::read`] or
+    /// [`Device::write`] here deadlocks.
+    fn read_mmd(_dev: &Device, _devnum: u8, _regnum: u16) -> Result<u16> {
         build_error!(VTABLE_DEFAULT_ERROR)
     }
 
     /// Overrides the default MMD write function for writing a MMD register.
-    fn write_mmd(_dev: &mut Device, _devnum: u8, _regnum: u16, _val: u16) -> Result {
+    ///
+    /// PHYLIB calls this with the MDIO bus lock held, so calling [`Device::read`] or
+    /// [`Device::write`] here deadlocks.
+    fn write_mmd(_dev: &Device, _devnum: u8, _regnum: u16, _val: u16) -> Result {
         build_error!(VTABLE_DEFAULT_ERROR)
     }
 

-- 
2.54.0

