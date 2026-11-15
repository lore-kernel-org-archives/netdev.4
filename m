Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794725282;
	b=vpwWeWosyCkElwqxltm6m9HvpOTYJmT95b5WR5Dcfn9JRclqiEIB4VZLAbWxq2BfDDfT
	 S5O+oakI4c0CwYtUEfWjrpuDO8M4JhUnNh8ioMBj1cX/N1jMMFIQKasBPUHSVA82u6x9z
	 JfsU/PNiK1mrxmgtEf1I0C6dC1HVAhkt+pG56jZXyDN1nWS2wt2WezFF0Zyikc1DwSXWI
	 DVkDnnjKOcaZBUJH76kSYWrB/mDDwxBH1s3LgXYs39v34eYjVvytLGn0Q2zjqhQGXeAmp
	 ZcxAR9XwPPwoOlTNZ12BnocbQACuasPAVb6Z2FSNqZKJGyliZ9xOjrSqTsgxYIupANg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794725282;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=8aCyDVugFTgDmxcEvIKcJWse+PFQb7Di/86YRfNsvCI=;
	b=BBqinV+STRiuVRwVrZDkNVBU6XMsfNeStNf+FH7k+5ruY85vqo86tjyBGIr+48nQBxhW
	 4EP1nV8n9RRNhoH6mcuH5NDehUSYveCfSZS+wpimCxRZH8Ys9juou+7FDl9L9Cj14YHlG
	 N23G3gH3MWn5xQA1bKI/7/mXGGmbHblLFK9Hs1hX1lFoIOXztRBNrskDN/5omCncL2Aak
	 VGQzIvRneYQcnBbfCp8bOFF5TE/MqAhCKoy88axo8xYRajNAePKAHMl/kYSBp3z9d874P
	 OI5dmY0/tr81Rk/eUHm7yw3ZoBBN3gP3Nwq81mKYkEsFjL4INSTLi+tBJG+6ERYhxgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B3GWvUEM;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA14606A331
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 06:48:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAA14606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B3GWvUEM
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e977109392so13081915ad.0
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 22:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794725281; x=1795330081; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8aCyDVugFTgDmxcEvIKcJWse+PFQb7Di/86YRfNsvCI=;
        b=B3GWvUEMoHdmiTkYjZmsLjMMR19mRPYxAeCW8d7JxN51JEh4ylSSFq5sOIsnjlI03l
         H4q3ff5MpjrWWGAvc4KDXmsZchRylu75+EZ5vUnexjuXm45OuG0eXe55ymUzmrUKMNfd
         kL5fUAlyDP62rMCFg7JuZcKWC6ru5T2G3TKIEa498hiCE9JPN36nmPgSkOWpFF7Puovz
         O+1bHxr5W+ymyR/BfRLraz+Qvzm14L/3mO9zYWfX2px8gllNtszznoGVB7UDs+spKXGu
         halR+HiKpE5QBwpMBXyCELw6TPde/hOlCp6N5c+0oU9un65Zg4TthGNArwNxmM5984/M
         bALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794725281; x=1795330081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8aCyDVugFTgDmxcEvIKcJWse+PFQb7Di/86YRfNsvCI=;
        b=b96hciq4ebkh+c/wCPihdnQj2geOD+Z6NMkKuTqrwnpLSy+iZpOvLSiXydTlzfMZ/z
         NqxRPsikfQ+nQ5goPpXBmplWvvwB9OuLoqwy77EQW8qogTa9knVUy1/GE5DImvqQoB5p
         12Dg6kXSGCGkV3rxeQYMhtpQ3hssDnXQoCTr/6F6qbtlb1nEwV4vIxxTZrldDFUxNZFc
         NWeTe+ASnGDuJ4HkyItxmUsK+1d9M4gsmET4HQD722Bzi9SbuRO3GTYJu6wVBMuUtBRA
         7GC0SJz4JN1cqPwwSZmgJW+dmcQRXNwaejpYXbfvfcHe3srbCqYDzRHyzUs7WauxiRaT
         APHQ==
X-Gm-Message-State: APuU4Z+PG+XN+kdoj3jGrt/f+ssbSj7cq9DrCBx1X+BQ4bEVr4lEaQeR
	HkyYoYem6NnIRriQHkPJ4+q6MbAcbErd0yGmgF2OrIi5Rt66BlvjoiW3
X-Gm-Gg: AYBFou3wmayexpQMurxdqc1gBh2FiiseyfkvXzEqOiTMLUTzuY/qJUIWGD3kmmeNWf6
	A/ffPGN8I81c/4BkOTCgNilO+n4HkD3AgfKcHI1fROFnw4pUPL8wCX2LbbA3rEmvfDEkZkg+eFb
	I1mWEJqjDXTih4W5JAX+Brr7IhEs98UDo/U6GfV7CGnsfeZxO4S0quG5Fg2VeEz2LvK0KPlTEWB
	8gZsmcYEzKNaiufrTBmon0ZjwwOyNQ6dnpHRC55AeJ0naS/L97gx4ovo5eT1/VlvGR7geKeP5Im
	tCQxzbU7Xa8wG+M9t3LJF4SSCJYicMAxVrWeacNxrSlokrlUMwffuK6x6AdhW7ZUCER6eppFVgX
	3RSAx2dd4BHMlB01EwkjWn/gPlAv8HisSq3YRGP0v/NH1RBZq+opGM13wRyCCCriXhYgJbq+wnv
	s0ZmdxqsdWkhNYCNAbJAWaguI+PT6wisk2YWZat5v95keteLu4TAcOwdpi8YH73hDK0YAkfZVBs
	IAF6pWQKF0CF9HtLIZ2wuaDozYZ72XxejJlEX9hePDAus81ekYhlmHnAPbMaqbi6/zy5r/WBMX9
	9L/gTNQkpIHq+2xvBL71qNkzw5IKA/xmskdPuPBUfmB27E2LuPijpRJIxq9O6Xz1hLBrSB5pem2
	4KcNizBE4XeSelG+6IgTW4rYC4AryU8b1XrSbQfusebaKYYGfHRD0P/UC
X-Received: by 2002:a17:90b:2783:b0:3b0:af68:77a with SMTP id 98e67ed59e1d1-3b1b07ef475mr6799366a91.6.1794725280970;
        Sat, 14 Nov 2026 22:48:00 -0800 (PST)
Received: from [169.254.3.1] ([143.248.188.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d27d26sm16136309a91.13.2026.11.14.22.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 22:48:00 -0800 (PST)
From: SeungJong Ha <engineer.jjhama@gmail.com>
Date: Sun, 15 Nov 2026 15:47:36 +0900
Subject: [PATCH RESEND net-next v2 1/3] rust: net: phy: drop read_mmd and
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
Message-Id: <20261115-exp-phy-rs-maybelocked-v2-1-8fa7897a0352@gmail.com>
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

