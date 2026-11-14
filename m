Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794658740;
	b=U72csSrx7Hbg2SLwiRmKX9c07X0St95G3IJIzpXswhECaNIucKECwWcd1aMmthqdHkG8
	 /v4XPFojssHxweOO4aTiJGhOyj/Ld8XmUiDA2sdGe9Y8K7kenVxAu5baSKjSL7To3Ad2J
	 ai9lX+N3xgVxLUUBvDCnDStSs4TShVCdsB7TzSLTq1M9+zo/AjQyoye06QVptnpfqneqd
	 gy3DBfzsdZ/JmI/qrufnDgrWd3ynIuqoQ2zQuqqt4zXSu0wRrsAYgSoVY+tUnM6Jc70GY
	 6NQOH1LmeCtSWvWywpogFmyaDmvEk+yROKWFEdfOaSj/XGfckBiFlg1XAoxlpCtxE6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794658740;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=Hlklr9HjlYj9YlI7wKU2ZXzvdmAz50MqQ9W4xUO0aG4=;
	b=rRBqliMsFW+U/y5YsaJMq+3LVNTxXAFdo0NQbJuVc42tdcoLxeq3XxhGIWBHZ9qcrp3R
	 gv1PPj8DTTB7ugoIa1HHft50tJqaV9fLi/gOShspdwa6FPeYKXzKUKiWYs9NkEJpCqENX
	 Vw7ac9e3Lq6aIbF4dHRxCCEYOhDMfVigU+9ZH7DT1M1fIJbl3DR4w77l5RZTThKrV8Gvy
	 DDIg7gNRejQP+zHg6LpYWCgVjMyHzSSU5x5Clsz9vJDUsRhR2w04bL2uH/nR2zTsnkDDg
	 Mklv/TpnS25YBhpSyAn56Ipv69sCbm0v1Oz7t7t8cxMj1V5kowpC5LTEC5ujeUCAvbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nk0I9zop;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E89606A323
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 12:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0E89606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nk0I9zop
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8b3577deeb0so890134b3a.3
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 04:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794658739; x=1795263539; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hlklr9HjlYj9YlI7wKU2ZXzvdmAz50MqQ9W4xUO0aG4=;
        b=nk0I9zoplicYOXQWxcVzh1Z8tt+dew+nPalHTF1yw0TUgpPwH2AoIlZVPkH+rgDzQN
         FsDUz0EKzXW62kD438IFcf+X0Y00KCf+2qS/CLsA1BInTKjyQ7i1QczZnkHWhND+nH2K
         5ch5z/VAU4TDqKNIFO3hiXuTzcn9BiQeEjSZnPl6684+RhOC4TalSau1DMjMCidfrs8a
         wlTxoDdqsRqJSqzysu3a8sVvwyYvBsGTI/rAW08l524lWOL4XZEAWN5x8OeNlL/gy9QV
         S3hAJ8B4aL7wDO+U3oMhDdzQaH78ul6lzAFD0pXTvCPGbK8n+pVgXV1GsnnnLH2H/w84
         +u2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794658739; x=1795263539;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hlklr9HjlYj9YlI7wKU2ZXzvdmAz50MqQ9W4xUO0aG4=;
        b=ju1jpJFyRGwT5+CmKhpLJo+rkZZ0UWQBwAAN8T76kDJ8LES90VxwWM9pm3oYIbIEBj
         IRLWGg32/qcec+BhRPKr7edwX7PSWsRm9peTK0qnyk/Cl+ZamHidMNUuvSALgU6iieuP
         l8k6/mdobHeDXo6e6GcBCJs9fAESYVtqr0lWKR7DGC6SKv/rdET1FQrX69xkd5zVfJAC
         dCCAm3Hno3hd+LCDSEZBAPejKOO2IwuVW6bti6sJ0MPvV2Z5kHcXeDj0u2AnVpKm4VXP
         AuDo7w+5z75PCAgk0v8iUa8rSjxrtEYIVm3tgLRbZyPzzD/9XDal3nEWIdbAE2DWyEY4
         mQWA==
X-Gm-Message-State: APuU4Z81Ixp/QuF7JFTLPkao4VMXah7jil/4HphcBCJfEG35owjY3Ah6
	ioj9uy7y/FZXB/++95woALjnssfKuGgBc5HvdeSqd54sWn2pPZHU3Gpz
X-Gm-Gg: AYBFou2Ai/8GglGA5B5Qfq6tIV5B2g03y9+eLyMdUR+vux8qDQxP+N2BFSX2snAFm36
	ikJcfK/Z1iNpN1EmhpYjbwPeesIA81ZApDVQ8/1kFa1Psrhz+XoA6LidQCOBjBnp/MsWX3C8G7j
	Ki9oqVfgDP4LnEoi65Yd1edJC3q5REoYV1TGBF0B9sfQW+jW7IIv1VOkFoAi7RHGCm2pQG03KPC
	/MPD9iXHCYS0OPoodkzzvNmdvarhV40Kixvse8Q+czKcSBIw+lUJXZ4HJXwvmACILRBaBhcrKCH
	P++fCzu56jRzDqhbPb2OiwjLCHLKUyAkEG7RdjdkDzMDNesQy+487VTnLJ0OCtnlmevi+Y3DgKR
	FNRc2jiN6vHeL50uzhNiuAphSP01w05KcZOwA78ggVKdn9WeWQROpksnmyopyjWOeOtbnFWOhqW
	jlJkSszp/rQ5SCvYMG+8Uv6bWHP8LSLVwyqHZT0nINCIacSR20IFiRohQc/DH/XJaIPno2ZQCLY
	ov5tY/SMbv+rjc7rOwkozQNXEBj7hp1NMLOj6Q3t6r+E81io5DTF+u/+/EsRw+3OT+FXqNdqpUg
	lGPpOpX1bGgifQsFmH1ZzGl/a+vceRAFjLdH+1/4b7g4REzBkoERS1RBdFdUAltPD8eMbTFR8fq
	KY613MN/ureV8cEQo7thpLC5JwhFdluSC+ZEoB4+dVn6ZaQd6hlKdRZ+p
X-Received: by 2002:a05:6a20:6a2b:b0:3eb:485f:7c9c with SMTP id adf61e73a8af0-3f7a6cad659mr4768680637.29.1794658739103;
        Sat, 14 Nov 2026 04:18:59 -0800 (PST)
Received: from [169.254.3.1] ([143.248.188.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bececcca19sm2094389b3a.4.2026.11.14.04.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 04:18:58 -0800 (PST)
From: SeungJong Ha <engineer.jjhama@gmail.com>
Date: Sat, 14 Nov 2026 21:18:24 +0900
Subject: [PATCH net-next v2 2/3] rust: net: phy: make Device generic over a
 lock context
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
Message-Id: <20261114-exp-phy-rs-maybelocked-v2-2-19a4dd658b6b@gmail.com>
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

Some PHY driver callbacks run without `phy_device->lock`, but every
callback gets a `Device` whose type says the lock is held.

Make `Device` generic over a lock context, `Locked` (the default) or
`MaybeLocked`, as `device::Device` is over its device context, and move
the methods that do not need the lock to both contexts. Update the
documentation and SAFETY comments to match. The next patch uses
`MaybeLocked`.

No functional change.

Signed-off-by: SeungJong Ha <engineer.jjhama@gmail.com>
---
 rust/kernel/net/phy.rs     | 141 ++++++++++++++++++++++++++++++---------------
 rust/kernel/net/phy/reg.rs |  17 +++---
 2 files changed, 105 insertions(+), 53 deletions(-)

diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index 7ca3f2329e6a..105a1b727a08 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -50,6 +50,51 @@ pub enum DuplexMode {
     Unknown,
 }
 
+/// A trait implemented by all contexts a [`Device`] can be used in.
+///
+/// - [`Locked`]: Serialized against every access made under `phy_device->lock`. The default
+///   context of [`Device`].
+/// - [`MaybeLocked`]: `phy_device->lock` may or may not be held.
+pub trait PhyContext: private::Sealed {}
+
+/// The [`Device`] context of every [`Driver`] callback that does not take a
+/// [`Device<MaybeLocked>`].
+///
+/// PHYLIB calls these callbacks in one of three ways:
+///
+/// - With `phy_device->lock` held: every callback not listed below.
+/// - Without the lock, but where PHYLIB ensures by other means that no other path accesses the
+///   instance: [`Driver::probe`] and [`Driver::get_features`], which are called from
+///   `phy_probe()`, and [`Driver::suspend`] and [`Driver::resume`].
+/// - Without the lock, possibly on an unbound device or one bound to another driver:
+///   [`Driver::match_phy_device`], which therefore only gets a shared reference.
+///
+/// # Invariants
+///
+/// For the lifetime of a `&mut Device<Locked>`, no other thread accesses the state of the
+/// `phy_device` that `phy_device->lock` protects.
+pub struct Locked;
+
+/// The [`Device`] context of callbacks that PHYLIB calls both with and without
+/// `phy_device->lock` held.
+///
+/// A callback in this context must not take `phy_device->lock`.
+///
+/// # Invariants
+///
+/// None beyond those of [`Device`].
+pub struct MaybeLocked;
+
+mod private {
+    pub trait Sealed {}
+
+    impl Sealed for super::Locked {}
+    impl Sealed for super::MaybeLocked {}
+}
+
+impl PhyContext for Locked {}
+impl PhyContext for MaybeLocked {}
+
 /// An instance of a PHY device.
 ///
 /// Wraps the kernel's [`struct phy_device`].
@@ -57,6 +102,9 @@ pub enum DuplexMode {
 /// A [`Device`] instance is created when a callback in [`Driver`] is executed. A PHY driver
 /// executes [`Driver`]'s methods during the callback.
 ///
+/// `Ctx` is the [`PhyContext`] of the callback. Methods that rely on the exclusive access that
+/// [`Locked`] describes are implemented for [`Device<Locked>`] only.
+///
 /// # Invariants
 ///
 /// - Referencing a `phy_device` using this struct asserts that you are in
@@ -71,34 +119,9 @@ pub enum DuplexMode {
 // [`Driver::resume`] and [`Driver::suspend`] also are called where only one thread can access
 // to the instance.
 #[repr(transparent)]
-pub struct Device(Opaque<bindings::phy_device>);
+pub struct Device<Ctx: PhyContext = Locked>(Opaque<bindings::phy_device>, PhantomData<Ctx>);
 
 impl Device {
-    /// Creates a new [`Device`] instance from a raw pointer.
-    ///
-    /// # Safety
-    ///
-    /// For the duration of `'a`,
-    /// - the pointer must point at a valid `phy_device`, and the caller
-    ///   must be in a context where all methods defined on this struct
-    ///   are safe to call.
-    /// - `(*ptr).mdio.dev` must be a valid.
-    unsafe fn from_raw<'a>(ptr: *mut bindings::phy_device) -> &'a mut Self {
-        // CAST: `Self` is a `repr(transparent)` wrapper around `bindings::phy_device`.
-        let ptr = ptr.cast::<Self>();
-        // SAFETY: by the function requirements the pointer is valid and we have unique access for
-        // the duration of `'a`.
-        unsafe { &mut *ptr }
-    }
-
-    /// Gets the id of the PHY.
-    pub fn phy_id(&self) -> u32 {
-        let phydev = self.0.get();
-        // SAFETY: The struct invariant ensures that we may access
-        // this field without additional synchronization.
-        unsafe { (*phydev).phy_id }
-    }
-
     /// Gets the state of PHY state machine states.
     pub fn state(&self) -> DeviceState {
         let phydev = self.0.get();
@@ -177,17 +200,6 @@ pub fn set_duplex(&mut self, mode: DuplexMode) {
         unsafe { (*phydev).duplex = v as c_int };
     }
 
-    /// Reads a PHY register.
-    // This function reads a hardware register and updates the stats so takes `&mut self`.
-    pub fn read<R: reg::Register>(&mut self, reg: R) -> Result<u16> {
-        reg.read(self)
-    }
-
-    /// Writes a PHY register.
-    pub fn write<R: reg::Register>(&mut self, reg: R, val: u16) -> Result {
-        reg.write(self, val)
-    }
-
     /// Reads a paged register.
     pub fn read_paged(&mut self, page: u16, regnum: u16) -> Result<u16> {
         let phydev = self.0.get();
@@ -206,14 +218,6 @@ pub fn resolve_aneg_linkmode(&mut self) {
         unsafe { bindings::phy_resolve_aneg_linkmode(phydev) };
     }
 
-    /// Executes software reset the PHY via `BMCR_RESET` bit.
-    pub fn genphy_soft_reset(&mut self) -> Result {
-        let phydev = self.0.get();
-        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
-        // So it's just an FFI call.
-        to_result(unsafe { bindings::genphy_soft_reset(phydev) })
-    }
-
     /// Initializes the PHY.
     pub fn init_hw(&mut self) -> Result {
         let phydev = self.0.get();
@@ -276,7 +280,52 @@ pub fn genphy_read_abilities(&mut self) -> Result {
     }
 }
 
-impl AsRef<kernel::device::Device> for Device {
+impl<Ctx: PhyContext> Device<Ctx> {
+    /// Creates a new [`Device`] instance from a raw pointer.
+    ///
+    /// # Safety
+    ///
+    /// For the duration of `'a`,
+    /// - the pointer must point at a valid `phy_device`, and the caller
+    ///   must be in the `Ctx` context, see [`Locked`] and [`MaybeLocked`].
+    /// - `(*ptr).mdio.dev` must be a valid.
+    unsafe fn from_raw<'a>(ptr: *mut bindings::phy_device) -> &'a mut Self {
+        // CAST: `Self` is a `repr(transparent)` wrapper around `bindings::phy_device`.
+        let ptr = ptr.cast::<Self>();
+        // SAFETY: By the function requirements the pointer is valid for `'a`. `Opaque` permits
+        // other `&mut` to the same `phy_device`, e.g. in a concurrent `MaybeLocked` callback.
+        unsafe { &mut *ptr }
+    }
+
+    /// Gets the id of the PHY.
+    pub fn phy_id(&self) -> u32 {
+        let phydev = self.0.get();
+        // SAFETY: `phydev` is valid by the type invariant of `Self`. `phy_id` is set by
+        // `phy_device_create()` and never written afterwards.
+        unsafe { (*phydev).phy_id }
+    }
+
+    /// Reads a PHY register.
+    // This function reads a hardware register and updates the stats so takes `&mut self`.
+    pub fn read<R: reg::Register>(&mut self, reg: R) -> Result<u16> {
+        reg.read(self)
+    }
+
+    /// Writes a PHY register.
+    pub fn write<R: reg::Register>(&mut self, reg: R, val: u16) -> Result {
+        reg.write(self, val)
+    }
+
+    /// Executes software reset the PHY via `BMCR_RESET` bit.
+    pub fn genphy_soft_reset(&mut self) -> Result {
+        let phydev = self.0.get();
+        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`. The C
+        // function does not require `phy_device->lock`; PHYLIB itself calls it without the lock.
+        to_result(unsafe { bindings::genphy_soft_reset(phydev) })
+    }
+}
+
+impl<Ctx: PhyContext> AsRef<kernel::device::Device> for Device<Ctx> {
     fn as_ref(&self) -> &kernel::device::Device {
         let phydev = self.0.get();
         // SAFETY: The struct invariant ensures that `mdio.dev` is valid.
diff --git a/rust/kernel/net/phy/reg.rs b/rust/kernel/net/phy/reg.rs
index 80e22c264ea8..e6892f3b855f 100644
--- a/rust/kernel/net/phy/reg.rs
+++ b/rust/kernel/net/phy/reg.rs
@@ -8,7 +8,10 @@
 //! Ethernet management interface clauses 22 and 45 register namespaces, as
 //! defined in IEEE 802.3.
 
-use super::Device;
+use super::{
+    Device,
+    PhyContext, //
+};
 use crate::{
     build_assert::build_assert,
     error::*,
@@ -44,10 +47,10 @@ pub trait Sealed {}
 /// ```
 pub trait Register: private::Sealed {
     /// Reads a PHY register.
-    fn read(&self, dev: &mut Device) -> Result<u16>;
+    fn read<C: PhyContext>(&self, dev: &mut Device<C>) -> Result<u16>;
 
     /// Writes a PHY register.
-    fn write(&self, dev: &mut Device, val: u16) -> Result;
+    fn write<C: PhyContext>(&self, dev: &mut Device<C>, val: u16) -> Result;
 
     /// Checks the link status and updates current link state.
     fn read_status(dev: &mut Device) -> Result<u16>;
@@ -104,7 +107,7 @@ pub const fn vendor_specific<const N: u8>() -> Self {
 impl private::Sealed for C22 {}
 
 impl Register for C22 {
-    fn read(&self, dev: &mut Device) -> Result<u16> {
+    fn read<C: PhyContext>(&self, dev: &mut Device<C>) -> Result<u16> {
         let phydev = dev.0.get();
         // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Device`.
         // So it's just an FFI call, open code of `phy_read()` with a valid `phy_device` pointer
@@ -116,7 +119,7 @@ fn read(&self, dev: &mut Device) -> Result<u16> {
         Ok(ret as u16)
     }
 
-    fn write(&self, dev: &mut Device, val: u16) -> Result {
+    fn write<C: PhyContext>(&self, dev: &mut Device<C>, val: u16) -> Result {
         let phydev = dev.0.get();
         // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Device`.
         // So it's just an FFI call, open code of `phy_write()` with a valid `phy_device` pointer
@@ -196,7 +199,7 @@ pub fn new(devad: Mmd, regnum: u16) -> Self {
 impl private::Sealed for C45 {}
 
 impl Register for C45 {
-    fn read(&self, dev: &mut Device) -> Result<u16> {
+    fn read<C: PhyContext>(&self, dev: &mut Device<C>) -> Result<u16> {
         let phydev = dev.0.get();
         // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Device`.
         // So it's just an FFI call.
@@ -206,7 +209,7 @@ fn read(&self, dev: &mut Device) -> Result<u16> {
         Ok(ret as u16)
     }
 
-    fn write(&self, dev: &mut Device, val: u16) -> Result {
+    fn write<C: PhyContext>(&self, dev: &mut Device<C>, val: u16) -> Result {
         let phydev = dev.0.get();
         // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Device`.
         // So it's just an FFI call.

-- 
2.54.0

