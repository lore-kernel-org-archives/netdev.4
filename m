Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794911803;
	b=uSYLc6gK+N450U+gmEsN90DztY9X8Plu5tADVJWC0WNpaWxzN5niLQOqIQRyMHnMahXO
	 Ldzk+EYPLxL5x3vHWBHcXnl/lksCwpiohWtwyfPRiU8UIuZshYq0+ycH2UN1Ryca2dDLf
	 /YYuKbHpHlTjaOK3RVd8dYcR9qWtelbRLeK0MzIuTluRH+Y3BVHcmFrxFdJzo35Pck05w
	 RcJDqYRJC01A4Q35CaaoTNE8aKtHDlkSj5GPxORsLuTyuk+AEqGOp5XPTDmeSzGSIrMbe
	 gv2dthCVdsz22lbx04ZUPCPH38u6GaH6xbqwtcqxHN2hLzdFZlOgTjS3Zsiab7d+XGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794911803;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=ckRpojr4ykb0gO8rk14uGRYSb8zTmNmAb+GlfSm1O1Y=;
	b=IXjRof5tit6N+cE3wzPQntw/R4AEky25jOXydK+g4Lt5hwojjKJxRkJUdkoqOAwQm9wU
	 GDmw86Xh/JGBXpBGHLY1VZSkQ130PVmkagbI6xd2T8KplIkfZChQgg2U+lQZofceM2j0w
	 /EI/vMXBxzsZarPQKG5qG99TGDB2kmLKqvH0HVjINLq96T2soZH+h7BBJzd+NeKvLKUfY
	 F941ZdFlFW2Lqpt1Z+CYQ9V3Tvqlhprel1lpr3cucL8D1/ho+PSBx19ZzL2jpK16RNRvJ
	 DMn+p+wwQpBuc54+4YY+QJ+Dh9Z3VDgY8Cv8nIIr9CmoL9hiYON9lIBLsc/AnNcU0QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i2v2UO4R;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88026606A8A3
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 10:36:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88026606A8A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i2v2UO4R
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8b29b83fdf1so2440920b3a.2
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 02:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794911801; x=1795516601; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ckRpojr4ykb0gO8rk14uGRYSb8zTmNmAb+GlfSm1O1Y=;
        b=i2v2UO4RrCRg6gmuuan8eICLn8sSEn3eL2kMLw3JnsUzDtAah3GUr5i6yugAg+AZ8I
         Xj3sBxwF9MAc9JsjDDB7Sr61sUx0DC2MztLLzdI/8uGCb/iSvyyy5yrdx1PTOpZ5NBG+
         m1Y+wWdfcEb/Yu1hAyF26tEWhEKTWHu32K7LTiu6rjMJQJJvs4zY7L0rv7f50kHX75WI
         bTT/91Vi0cnVP/8geYOCqelEJYn9DQaFZvhCl2XFz+j3uZEy4gGFD7gq9xbu7v3skTeH
         fmDB3mmci2UpeL3ruS5oyvuVOD4vfzZgoVTj/gc447Lcc4Y9qQVgMdHHSFirDU/ZM2Oi
         5AAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794911801; x=1795516601;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ckRpojr4ykb0gO8rk14uGRYSb8zTmNmAb+GlfSm1O1Y=;
        b=Y7GVRzIrrRY10s4CDEczh3Bn4IlzMNvEoDHaxyvsjM3gGNKWqhCwSMQDRkzLZMYW+j
         31lb0cbN6T0RjMgj4nFOG4ebSQ8MAaChyLhLQABUq/9JymklsKlpscl+HJ5aP6DHu75F
         IPaILK9n6Gty+SWmWRnBf388v+X9tEgDkfDpLJYx2G82NVyxGrf7yfY/Eu/NGom+SZnR
         FPH2j07i2Msj+N++EDEcwlJbmDL8zNcgilpaG1uvLqfarDZRbJO4xsaK9Zu/uWlYP7kJ
         NquQ/UsWdIMIyEav6L4FhKaVrKdGagvZJucZ+m+PuhEcRg+wGKq4Q3A/wjpC1ZXxblGg
         HNEg==
X-Gm-Message-State: APuU4Z8zVW3CxrHcSXQUDznDIFVEj2Xht7nap/oqsEK0XPJNp2whn++J
	RivstcC3e/L0UM2zcuwN+D8Gq+hMvmA+KcvdUsEfe9jShXeomG1DrloM
X-Gm-Gg: AZFdTZdd0oxoxCR8m2FYxnCEqe3KLaEjlbE80SR02DxFm1V1sUfrt+DyGef3R2TLiQv
	n2ghOJGINKJKg9WmWjLwOPLfbIxRgYgkpDRIyKccW8ezb9Rs3UJaP6FS4Neb+xw+Nu5oSNE40IA
	w+/PphliUZsIu2BpLsiLRBSX347EVNI4Ui4mR5/f7Yn1TM79CHgvs+7/i+hHs5h25n7OWh+O+BX
	AKHZbNj5par8jmkhJuFHiXpS0aPvGj5Z2fwipgSlLpCMVo8umVoR4dPhIe++kWL0J8CyhegqAaZ
	QCg9cfCt6aWUt4KoU20er1bcFzN3oM9WVRLH2eaywzTMy8Qd23c/OsSoiFapeBQO2xOuFXN2/qy
	K43ZPisSR6qNhfmKcZ2UG7gVbF3x3OpMqvxfw8jTFLQaMCb+hPlAXh1kxEXv+Dt7rBFL5p/Q3HB
	RKeMJl6P7fjUIosX6nLTvLsGiw4mrKGqiaNrncWUhKkxACAd+F1s6oxluV8gORPJjynHb0yzmtD
	tryO+WI9zMj5c5LSyut5s+tBKfunK9gP6UXL9A/Of8ZItkH/xb9pY4sSy6XTdMiSndxuxfcw+EU
	wRQiZrIOPh6xpNDxZfCM5wXypqEdv55C+i8LRXgYYyc2carfC9Nmybt5aSli1pmczWKlAvghBas
	l+Ai4K0xv+I+HLnBMY1rD/ZOEN8D/bK/OUhc6tVtKfzGJxKERgN5YpBTX
X-Received: by 2002:a17:903:228b:b0:2e9:5eee:e078 with SMTP id d9443c01a7336-2ee0d666816mr121363455ad.3.1794911800778;
        Tue, 17 Nov 2026 02:36:40 -0800 (PST)
Received: from [169.254.3.1] ([143.248.188.96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd76d8f08sm13094805ad.4.2026.11.17.02.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:36:40 -0800 (PST)
From: SeungJong Ha <engineer.jjhama@gmail.com>
Date: Tue, 17 Nov 2026 19:36:20 +0900
Subject: [PATCH net-next v3 2/3] rust: net: phy: make Device generic over a
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
Message-Id: <20261117-exp-phy-rs-maybelocked-v3-2-4e183a7366a7@gmail.com>
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

Every PHY driver callback gets a `Device` that assumes `phy_device->lock`
is held, but suspend may run while another path holds it.

Make `Device` generic over a lock context, `Locked` (the default) or
`MaybeLocked`, as `device::Device` is, and move the methods that do not
need the lock to both contexts. The next patch moves suspend to
`MaybeLocked`.

Document when the `Locked` callbacks run without the lock, including the
existing phy_mii_ioctl() race, and fix their SAFETY comments.

No functional change.

Signed-off-by: SeungJong Ha <engineer.jjhama@gmail.com>
---
 rust/kernel/net/phy.rs     | 207 +++++++++++++++++++++++++++------------------
 rust/kernel/net/phy/reg.rs |  17 ++--
 2 files changed, 133 insertions(+), 91 deletions(-)

diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index 4604a9c0a511..8cbb4c19dac1 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -50,6 +50,55 @@ pub enum DuplexMode {
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
+/// PHYLIB calls these callbacks with `phy_device->lock` held, except:
+///
+/// - [`Driver::probe`] and [`Driver::get_features`], which `phy_probe()` calls without the lock
+///   before the device is attached.
+/// - [`Driver::soft_reset`], which `phy_init_hw()` calls without the lock from
+///   `phy_attach_direct()` and `mdio_bus_phy_resume()` while the state machine is not running, and
+///   from MAC drivers that call `phy_init_hw()` directly, which are then responsible for exclusive
+///   access. `phy_mii_ioctl()` also calls it without the lock while the state machine may run,
+///   which is an existing PHYLIB race.
+/// - [`Driver::read_status`], when a MAC driver calls `phy_read_status()` directly. The MAC
+///   driver is then responsible for exclusive access.
+///
+/// # Invariants
+///
+/// For the lifetime of a `&mut Device<Locked>`, no other thread accesses the state of the
+/// `phy_device` that `phy_device->lock` protects.
+pub struct Locked;
+
+/// The [`Device`] context of callbacks that PHYLIB may call without `phy_device->lock` while
+/// another path holds it.
+///
+/// Only methods that do not rely on the lock are available. A callback in this context must not
+/// take `phy_device->lock`.
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
@@ -57,48 +106,19 @@ pub enum DuplexMode {
 /// A [`Device`] instance is created when a callback in [`Driver`] is executed. A PHY driver
 /// executes [`Driver`]'s methods during the callback.
 ///
+/// `Ctx` is the [`PhyContext`] of the callback. Methods that rely on the exclusive access that
+/// [`Locked`] describes are implemented for [`Device<Locked>`] only.
+///
 /// # Invariants
 ///
-/// - Referencing a `phy_device` using this struct asserts that you are in
-///   a context where all methods defined on this struct are safe to call.
-/// - This struct always has a valid `self.0.mdio.dev`.
+/// - `self.0` is a valid `phy_device`, and `self.0.mdio.dev` is a valid `struct device`.
+/// - The invariants of `Ctx` hold for the lifetime of a `&mut Device<Ctx>`.
 ///
 /// [`struct phy_device`]: srctree/include/linux/phy.h
-// During the calls to most functions in [`Driver`], the C side (`PHYLIB`) holds a lock that is
-// unique for every instance of [`Device`]. `PHYLIB` uses a different serialization technique for
-// [`Driver::resume`] and [`Driver::suspend`]: `PHYLIB` updates `phy_device`'s state with
-// the lock held, thus guaranteeing that [`Driver::resume`] has exclusive access to the instance.
-// [`Driver::resume`] and [`Driver::suspend`] also are called where only one thread can access
-// to the instance.
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
@@ -177,17 +197,6 @@ pub fn set_duplex(&mut self, mode: DuplexMode) {
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
@@ -238,14 +247,6 @@ pub fn genphy_resume(&mut self) -> Result {
         to_result(unsafe { bindings::genphy_resume(phydev) })
     }
 
-    /// Suspends the PHY via `BMCR_PDOWN` bit.
-    pub fn genphy_suspend(&mut self) -> Result {
-        let phydev = self.0.get();
-        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
-        // So it's just an FFI call.
-        to_result(unsafe { bindings::genphy_suspend(phydev) })
-    }
-
     /// Checks the link status and updates current link state.
     pub fn genphy_read_status<R: reg::Register>(&mut self) -> Result<u16> {
         R::read_status(self)
@@ -276,7 +277,52 @@ pub fn genphy_read_abilities(&mut self) -> Result {
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
+    /// Suspends the PHY via `BMCR_PDOWN` bit.
+    pub fn genphy_suspend(&mut self) -> Result {
+        let phydev = self.0.get();
+        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`. The C
+        // function only sets `BMCR_PDOWN`, serialized by the MDIO bus lock.
+        to_result(unsafe { bindings::genphy_suspend(phydev) })
+    }
+}
+
+impl<Ctx: PhyContext> AsRef<kernel::device::Device> for Device<Ctx> {
     fn as_ref(&self) -> &kernel::device::Device {
         let phydev = self.0.get();
         // SAFETY: The struct invariant ensures that `mdio.dev` is valid.
@@ -309,10 +355,10 @@ impl<T: Driver> Adapter<T> {
     /// `phydev` must be passed by the corresponding callback in `phy_driver`.
     unsafe extern "C" fn soft_reset_callback(phydev: *mut bindings::phy_device) -> c_int {
         from_result(|| {
-            // SAFETY: This callback is called only in contexts
-            // where we hold `phy_device->lock`, so the accessors on
-            // `Device` are okay to call.
-            let dev = unsafe { Device::from_raw(phydev) };
+            // SAFETY: `phy_init_hw()` calls this with `phy_device->lock` held, or without it while
+            // the state machine is not running or a MAC driver ensures exclusive access.
+            // `phy_mii_ioctl()` is an exception, see `Locked`. This is the `Locked` context.
+            let dev = unsafe { Device::<Locked>::from_raw(phydev) };
             T::soft_reset(dev)?;
             Ok(0)
         })
@@ -323,11 +369,9 @@ impl<T: Driver> Adapter<T> {
     /// `phydev` must be passed by the corresponding callback in `phy_driver`.
     unsafe extern "C" fn probe_callback(phydev: *mut bindings::phy_device) -> c_int {
         from_result(|| {
-            // SAFETY: This callback is called only in contexts
-            // where we can exclusively access `phy_device` because
-            // it's not published yet, so the accessors on `Device` are okay
-            // to call.
-            let dev = unsafe { Device::from_raw(phydev) };
+            // SAFETY: `phy_probe()` calls this before the device is attached, when no other PHYLIB
+            // path accesses it. This is the `Locked` context.
+            let dev = unsafe { Device::<Locked>::from_raw(phydev) };
             T::probe(dev)?;
             Ok(0)
         })
@@ -338,10 +382,9 @@ impl<T: Driver> Adapter<T> {
     /// `phydev` must be passed by the corresponding callback in `phy_driver`.
     unsafe extern "C" fn get_features_callback(phydev: *mut bindings::phy_device) -> c_int {
         from_result(|| {
-            // SAFETY: This callback is called only in contexts
-            // where we hold `phy_device->lock`, so the accessors on
-            // `Device` are okay to call.
-            let dev = unsafe { Device::from_raw(phydev) };
+            // SAFETY: `phy_probe()` calls this without `phy_device->lock`, under the same
+            // assumption as `probe`. This is the `Locked` context.
+            let dev = unsafe { Device::<Locked>::from_raw(phydev) };
             T::get_features(dev)?;
             Ok(0)
         })
@@ -366,10 +409,9 @@ impl<T: Driver> Adapter<T> {
     /// `phydev` must be passed by the corresponding callback in `phy_driver`.
     unsafe extern "C" fn resume_callback(phydev: *mut bindings::phy_device) -> c_int {
         from_result(|| {
-            // SAFETY: The C core code ensures that the accessors on
-            // `Device` are okay to call even though `phy_device->lock`
-            // might not be held.
-            let dev = unsafe { Device::from_raw(phydev) };
+            // SAFETY: `__phy_resume()` asserts that `phy_device->lock` is held. This is the
+            // `Locked` context.
+            let dev = unsafe { Device::<Locked>::from_raw(phydev) };
             T::resume(dev)?;
             Ok(0)
         })
@@ -380,10 +422,9 @@ impl<T: Driver> Adapter<T> {
     /// `phydev` must be passed by the corresponding callback in `phy_driver`.
     unsafe extern "C" fn config_aneg_callback(phydev: *mut bindings::phy_device) -> c_int {
         from_result(|| {
-            // SAFETY: This callback is called only in contexts
-            // where we hold `phy_device->lock`, so the accessors on
-            // `Device` are okay to call.
-            let dev = unsafe { Device::from_raw(phydev) };
+            // SAFETY: PHYLIB holds `phy_device->lock` when it calls this. This is the `Locked`
+            // context.
+            let dev = unsafe { Device::<Locked>::from_raw(phydev) };
             T::config_aneg(dev)?;
             Ok(0)
         })
@@ -394,10 +435,10 @@ impl<T: Driver> Adapter<T> {
     /// `phydev` must be passed by the corresponding callback in `phy_driver`.
     unsafe extern "C" fn read_status_callback(phydev: *mut bindings::phy_device) -> c_int {
         from_result(|| {
-            // SAFETY: This callback is called only in contexts
-            // where we hold `phy_device->lock`, so the accessors on
-            // `Device` are okay to call.
-            let dev = unsafe { Device::from_raw(phydev) };
+            // SAFETY: PHYLIB holds `phy_device->lock` when it calls this, or a MAC driver that
+            // calls `phy_read_status()` directly ensures exclusive access. This is the `Locked`
+            // context.
+            let dev = unsafe { Device::<Locked>::from_raw(phydev) };
             T::read_status(dev)?;
             Ok(0)
         })
@@ -407,10 +448,8 @@ impl<T: Driver> Adapter<T> {
     ///
     /// `phydev` must be passed by the corresponding callback in `phy_driver`.
     unsafe extern "C" fn link_change_notify_callback(phydev: *mut bindings::phy_device) {
-        // SAFETY: This callback is called only in contexts
-        // where we hold `phy_device->lock`, so the accessors on
-        // `Device` are okay to call.
-        let dev = unsafe { Device::from_raw(phydev) };
+        // SAFETY: PHYLIB holds `phy_device->lock` when it calls this. This is the `Locked` context.
+        let dev = unsafe { Device::<Locked>::from_raw(phydev) };
         T::link_change_notify(dev);
     }
 }
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

