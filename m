Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795610916;
	b=uTOHDCc7Cdb7Yokrkj9fYfeR3ulNoBqiWXituFPYPyXZdOR63t7jTdUDIn2SLnEi1kac
	 1S0oHmhP82lksz3436D4p60VHuyNgXsy2mhhUanEKlZGUHvruWpeZh9cv1eA1u0eVmBZI
	 V4JIoj8A3f5nCgLg7pOiDHnrqWD90RHdCDbx0mkMqitLT/3FLU17o2Zl+66GUaG9XfxCz
	 0ZBAqikbNn843ByEeOd4JpFY2n3aOAvIIzh4aXigPdeQAjS884vPisQMjpUgKOnd2djEf
	 65X9d4RvsBGGtvjbfHzqBxzV1KVq5lnI2Assov+92CufEukNSdlcnu8ngDk0TKgJ9gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795610916;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=SAWXjGXaTZ1yifByDjbk7j6PeeVyExFOz8BWyY4y5x0=;
	b=W3JB2e1y3IYrvwzwS5T+kwXpfmmRa29isf+OZlVtQ1xQHdMbKQYfCxVx03nRUzky8ePr
	 IxPg7Z8CP0qKImeZzN5uFrmP/RXNEzV9xfPgtH0+4u2Hg/kGbEoPZX5S4NjPMHB5S7gOv
	 y3zDG6oS/TB35X/2+KyC01uaSmQlqp/SL9oZvvAn/0q41elqN8aVVDyVn1aw25rVFD+CA
	 CgTbXQoYjPJrRqA18SsxfuuvPnMqs21NZ/aDLhfm1VDdkrQ1kdI0KmosG7hdQiXM6FArN
	 x4JMaQBwaClK4XaXSdTQ0qzrEPdyOF3IJs4Vnwg0iR+vCvAkeVQ1W/ZteW8Eu4xXJNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tc4LiAxI;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3712606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 12:48:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3712606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tc4LiAxI
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4a3e706b5dfso3580250f8f.2
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 04:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795610914; x=1796215714; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SAWXjGXaTZ1yifByDjbk7j6PeeVyExFOz8BWyY4y5x0=;
        b=tc4LiAxInFZjm0FZKU4AlIyL7VuUe+IeokgpJQK1fsNKpT2FV8j+GejfwjTBvCWagB
         mSx2VwoB4EGPQG04Y8Vp+iiRcPXI99JGObgxyalebVsqxTAg9mNd83wAgYeLssb6nBGk
         NnhWpX59iyE1gYfVLRYZeTfP+MwX2CPG9Hzr+lO1Cr55/pqGxjNjd2buwf8p6S7mHG57
         a9kq5yICWU4KDQDC90VBuRCly2qnvQsEZTqvTd/WZSwwZtRed1QuzP5W9tP6fdpkEzdU
         rluHlcVlTurEqA5ezu/HLHeRlJ6AS/skLrQY1EkXnXlNXzzXn4AlQLhNMFjPUCeStWx0
         ujyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795610914; x=1796215714;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SAWXjGXaTZ1yifByDjbk7j6PeeVyExFOz8BWyY4y5x0=;
        b=YmYuHh/aohhfYYQjrlQHOAZaJCmwgEaQ/eijuePLJCGO4yuAGWaSFGkH2y/tQyPpFE
         OxlTVKqUt7TULWYGhgAyOtjniBScld7Uc40zeZmTI5eMxg2OPkUaMM8ObjSZX/9qo7m0
         3u2kFfEr/W+TcM/ffmryTjT4rWzceweKdAzYbS670migwK9oa3Uq6gU5ph4s4vWLL/AQ
         8+gfaTKcoPBxLx10tNwjvuJ0sxOLeIbkjWQhSW5BSAsmndAe/Fdi7QG7sCY4uRPw48Gh
         Ao5B8Hf/KlwqrdE0ry7pR9qhMqBFzq0X9lmGf81pxVltZCqWLbG6qAqswEYTUVIOoE4X
         c7ow==
X-Forwarded-Encrypted: i=1; AL+hErFtAZOQ0yfkJT02IA5R/d7wnqUNlJTNHwc0qdHYvCmLcHDh47VA32PNEs14WtntZONvs22LFuY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Bvvmm8c+GSAK7Rhp4Nl1giuOdiHxG/16lMkIT9mX5ZmSBtphw
	iYH/D924sDlJ54En8P4Xcn0VEO1geSEXMQFPiNVBuVRDDSj2UOGfWyMSMqwRl1yTtFc=
X-Gm-Gg: AZFdTZeNSiBerf4MlWiMTWVMWeO1M3LI+Fdi2WlDoCGbHimtpneJSUU+L1/7fpTXNxe
	8+d6LLkhOufpRXVaXBmnuy8TMBN/iPZey2zg0C+h/Ozvwo9DBs1FmYtK8UXeEydaKa6CqxlRNZK
	HWgfj3PXioRM508BaY3Cfr6+n6vCytQh/C0E0G7Wm6WcBF+6BIYmj5HS4niKEhkzdUrUiok8gE3
	zuSDYOXKBeSZUfKzpkT42iI3SuxKZxHOc3gqcjP3ZaJY271iBOHLsWUyv+KGmS7ZM+pGy8AfhM/
	LLknZH0ErgEWa8JaU4NsadwpWMOrt2R98RUOmUKzR/CW9GYl9BViLjlj3RiUIIC21G0dyGnhdsb
	jiKecsN6L0Xag96sPMbO7dWKyzXbYFcoVaWCuoYhI5ip+vJ6lRM+UH0/mhDTtnwnpKOKxV0CCj0
	DAWKQfhFRJSRQEARa8N19GDIey2qvbIOZbGzcw0vUFYOvcziYUjqAM6NCnHYIsPTcYT1UfZ+md0
	neU3ogw0rabFTXZAEmMQCv5C7xgQqStug3K6L0TJprfBtT/SdwICg7CX4MW7pYJGL3B1tcyTqNU
	w8nA+l2viJyK+ptJXbWR70e2CaAgInBwErAVyYIRh7YhwBSG6vnPhmIg+9tZy0ILzjrcCbhCcjU
	00BXusGxou/C8
X-Received: by 2002:a5d:6f13:0:b0:491:3fdd:af42 with SMTP id ffacd0b85a97d-4abb5cc19b5mr30983044f8f.37.1795610914011;
        Wed, 25 Nov 2026 04:48:34 -0800 (PST)
Received: from [192.168.0.36] (firewall-214-232.seh.ox.ac.uk. [163.1.214.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad6403fdbbsm25732393f8f.15.2026.11.25.04.48.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 04:48:33 -0800 (PST)
Message-ID: <c3e6cc57-a091-4342-bbb5-03b594c05fdf@gmail.com>
Date: Wed, 25 Nov 2026 12:48:33 +0000
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/2] atlantic: skip hardware teardown when PCIe parent is
From: Tobias Heath <heathtobias@gmail.com>
To: Andreas Noever <andreas.noever@gmail.com>,
 Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat
 <YehezkelShB@gmail.com>, Sukhdeep Singh <sukhdeeps@marvell.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Richard Cochran <richardcochran@gmail.com>, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <8fbb5876-e556-45a1-96b5-4a8061de9e5d@gmail.com>
 <31d3413a-9aa0-4208-8e15-3ba85829ef79@gmail.com>
Content-Language: en-US
In-Reply-To: <31d3413a-9aa0-4208-8e15-3ba85829ef79@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When the PCIe parent bridge of an atlantic NIC is removed - which
happens routinely on laptops with Thunderbolt docks whenever the dock
is physically disconnected while any sleep / power management cycle is
in flight - the kernel enters a deadlock:

  * pciehp_ist invokes pci_stop_and_remove_bus_device() on the atlantic
    device; this acquires the device's lock and calls the driver's
    .remove callback (aq_pci_remove).
  * aq_pci_remove -> unregister_netdev -> aq_ndev_close -> aq_nic_stop
    -> aq_vec_stop -> napi_disable -> napi_disable_locked.
  * napi_disable_locked waits for NAPI_STATE_SCHED to clear in a
    usleep_range loop. NAPI_STATE_SCHED is cleared by the poll
    function (aq_vec_poll) calling napi_complete_done, but the poll
    function reads the RX ring state over the (now disconnected) PCIe
    bus: config reads return 0xffffffff, the poll never decides it has
    quiesced, NAPI_STATE_SCHED never clears, and the loop spins
    indefinitely.
  * Every other device_resume waiting on the parent bridge blocks on
    the mutex held by pciehp_ist; most visibly an async wiphy_resume
    for the laptop's Wi-Fi, which DPM watchdog times out at 120 s,
    panicking the kernel.

The kernel already has the signal we need: pciehp calls
pci_dev_set_disconnected() (which sets dev->error_state to
pci_channel_io_perm_failure) via pci_walk_bus() before starting the
device-removal walk. By the time aq_pci_remove() runs on a surprise-
removed device, pci_dev_is_disconnected(pdev) is already true.

aq_nic_deinit() in the same file already consults the equivalent
c pci_device_is_present() for the firmware deinit path; aq_nic_stop()
simply does not. This patch adds the check: when the PCIe parent is
disconnected, skip the hardware-touch work (hw_irq_disable, aq_vec_stop
with its napi_disable, aq_ptp_ring_stop, hw_stop) and still free the
IRQs that need userspace-side cleanup. unregister_netdev() in the
caller continues to free the NAPI structures on the kernel's side as
normal.

This mirrors the handling in Marvell's AQtion Windows driver
(aqnic650.sys 3.1.10), which uses a "surprise_removed" flag set from
NdisDevicePnPEventSurpriseRemoved to short-circuit every hardware
code path while still completing software teardown. Static analysis of
that driver confirmed both the pattern and the bounded wait times on
its remaining hardware polls (1 s register poll, 2 s firmware mailbox)
- details available on request.

Before this patch, with a TB dock connected to the atlantic device,
disconnecting the dock during any sleep or power transition caused a
reproducible DPM-watchdog panic at T+120 s. With this patch, the
teardown completes in milliseconds and the system continues normally.

Signed-off-by: Tobias Heath <heathtobias@gmail.com>
---
 .../net/ethernet/aquantia/atlantic/aq_nic.c   | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/net/ethernet/aquantia/atlantic/aq_nic.c
b/drivers/net/ethernet/aquantia/atlantic/aq_nic.c
index 42e0fe924..0cca82974 100644
--- a/drivers/net/ethernet/aquantia/atlantic/aq_nic.c
+++ b/drivers/net/ethernet/aquantia/atlantic/aq_nic.c
@@ -1434,6 +1434,27 @@ int aq_nic_stop(struct aq_nic_s *self)
 	timer_delete_sync(&self->service_timer);
 	cancel_work_sync(&self->service_task);

+	/*
+	 * If the PCIe parent bridge was removed (e.g. a Thunderbolt dock
+	 * was physically unplugged while the kernel was mid-teardown),
+	 * the device's config space reads as all-ones. Register writes are
+	 * harmless no-ops, but napi_disable() waits for NAPI_STATE_SCHED
+	 * to clear via napi_complete_done() from the poll function, which
+	 * reads the RX ring state from dead hardware and never decides it
+	 * is done — the wait loop spins indefinitely. This matches the
+	 * Windows AQtion driver's handling of NdisDevicePnPEventSurpriseRemoved
+	 * (a "surprise_removed" flag short-circuits every hardware path
+	 * while still freeing software state).
+	 *
+	 * Skip the hardware-touching teardown; unregister_netdev() in the
+	 * caller takes care of the NAPI structures on the kernel side.
+	 */
+	if (pci_dev_is_disconnected(self->pdev)) {
+		if (!self->aq_nic_cfg.is_polling)
+			aq_pci_func_free_irqs(self);
+		return 0;
+	}
+
 	self->aq_hw_ops->hw_irq_disable(self->aq_hw, AQ_CFG_IRQ_MASK);

 	if (self->aq_nic_cfg.is_polling)
-- 
2.56.1
