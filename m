Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795495377;
	b=lCbru9aSnqy1oq7+K4oxVR+2hNP0/c0urraG7vuGB4Qo3D3e8yjMHKTclEj6BHDjv/E4
	 LYyEvhkTcKEiCxk45VLm6lnl9vf0/4fBsH/gnOYK0Plr66LFW6/M1RkahDlTRL8E6ks4g
	 E1BotI3GUhKbBhdN1WbGYZuC9dqxY+8nGSKVWzCRrOB0vnnZRhmI4IdkKEDfRhcDSnU2H
	 bw7tbTlEVamPtQCdGRQuj1DUKXZMbA6GXLO7/jQFABF81sfw3bJdxUVy7VtvVb+4kOUOm
	 o5fyMn/StXXzJE1rU3oahj3GwUk/UBJCIPZClkVUBCo9gEBcD7zOalxXlmmiw6yN/xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795495377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=h3S16/5KPWtPB7WBVUH8p12gM2oBDsoLItSzaUNlh4Y=;
	b=VVUndh4SHPKfULzrMXxtWzkMi2WVUT1b6JpHNpjVIGlK00HYKbwM9rtvfL2BWZbmMian
	 yJ6gr5CgbuH3kwisYMTM+HECEbzU4yFsQaMDdJOfOABudN3Gh6L8QB0GltgRda7StFS9B
	 hPBipndEiYdJnI0dRV2FEjDD8eiggYjx7+tju/VH39chBlrWWXB7od5myn7Fcg3uMQBbO
	 BZj5MxcTwjAFFsQUNqnvvKxor0ZD4npJVNYcA+VHPS6/nMg5MBroETCOIP+Nthy2DLpGG
	 Pm8DpzBUB18flEL+hTEO0QDbctxkaIO63UnG+LXWhKOb+EXjaIoSDaDAVDAJI3Deyzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XCuIvvcz;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51125606A6BD
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 04:42:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51125606A6BD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XCuIvvcz
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-386c336eab8so199217eec.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 20:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795495376; x=1796100176; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h3S16/5KPWtPB7WBVUH8p12gM2oBDsoLItSzaUNlh4Y=;
        b=XCuIvvczz+YBWGfsc8wEBGkRO5bwumbAmEf80t21XdT61wC3/odiARaRnx8bgq+W+0
         +BVhtQXFud0qm3F0zqmlZAKZ2ib9n1plrxA4K6fK0ifImFNRjj+KAFL1JWkQjYh3rcGY
         E2mNngoLjHUSdGW5cFkS+/PmvCX+Ula3Mva9RcPEu77iqOB7glVZfsBte1IiXrGcnrKV
         74PJGBNQ8GmOpk165KhFIECcAJRlAR4ososvLEoCNbeNynIoJqCoN0dHet2/+Aere4Vf
         yOilQTB2T198uz3Tsx7N/cdRbasjXPjmoSubrkNad7sSABFtkQUPAJPXHDPAuLw01MgA
         YQrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795495376; x=1796100176;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h3S16/5KPWtPB7WBVUH8p12gM2oBDsoLItSzaUNlh4Y=;
        b=WWMPZamw1Vv8mgFKmWIDTMNe7UFoagdbJz3XXcW4PphhYp+GZTNJ2pcJx5xouKoHZV
         u54aQpU1/sgOYa97t0j6v0wZzxsQCOxp3wSyozVErpxvyqFcHOmBBXw4nkXgJImt6trD
         FNpDEcjRy0maMeBeCZkxJNdbQe7IDbNnhw/f6PBfB7Eq5Sq9tA7kdmB2C3obgUQy+oKV
         bsgefZ17FeOfcHUBOCXzTlVV4uKWcKyBAQcsxEa+TcjTcgyY1LJNZ18ipWONhqLNXkGv
         EwRux9ImElP2fk84THFxJoitpZbBljr1fBEXSxv3o2Jpgju6RhaRjDiUHDUd0HqyFDNI
         dF7A==
X-Gm-Message-State: APuU4Z83yPNHvRUVY+eziMNfHpxoTE6hqWojdfqy/hF5srkhRXfN/6+y
	xCNAS5+Lo9zKyfCXXyHhmOhvjKGUPLthPVkLPL/SEW57uZ7d9NvSUzDP
X-Gm-Gg: AZFdTZcdVs3XvYiEDJ/TLk6ZOfI1KRoKbvGgP3uG3qm2NTpFldbH+nMIJYMDYTLQV8r
	kdFY/ROEyj53tCykGvFcyznulIMtTjQYu2EYMVCf9Z0WsUz8y2TVXPVOcsPvFKis9ifMSEklEGv
	CigeE3iuMNXRNTnyNhjyX+iEW8UA1r3rWOrgm4H02qwDoxWsBRpifGGzTAzBz/x68lwNz3aEaGN
	RCsXEkBWwYuWfyXvblFLz2J+qrIGTk6b+aTWwDTaSiOX8BM7fEj3GPGez1ugOaQYrJGfcH7ILOz
	yBEHZ1EcGlN5HL8N4oSdHNBx6J8hqlEtgY/7J/eFcu/B0RQOLsY29pksjphEeFjPyPCP5iHrRTs
	1HQJT08nSPlwJxRlbw36ycTf7WicUehYYD1HN3hbXDHn+lbrW/5HwbFxqVuTZGHDYzxbOvQJL8k
	i3L1cZew02bey1cdjpzRtqZ/nTawWboKmbGJ/mYudoenNLqcaRz5CI45iysMooeKk2KnBly3lnX
	qHPa7EGu/uavH+7kh7lQPbmAuAO0n7tqF/eNocxMKSaDvBQZkDOv9k1F8BIfUyV1nr9OoUN/bp0
	7J+t5BP3AeTlByFQh4ujByOKwjfleupw+1St00KdnAp818A1gq+sJ14pdOkmA7KLtmU+d68yWCk
	n0rWdK0YqP0yVKxW4dwvMLj5d60tU4I0eGlvGQOTyYtPWfx4xf7ommYgz5og0Py6wHZnw7ryI
X-Received: by 2002:a05:7301:d804:b0:386:b076:a940 with SMTP id 5a478bee46e88-386b076a9e4mr5229992eec.26.1795495376261;
        Mon, 23 Nov 2026 20:42:56 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm40108125eec.23.2026.11.23.20.42.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 20:42:55 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org,
	andrew+netdev@lunn.ch,
	arkadiusz.kubalewski@intel.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	jiri@resnulli.us,
	kuba@kernel.org,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	rmk+kernel@armlinux.org.uk,
	vadim.fedorenko@linux.dev,
	vladimir.oltean@nxp.com
Subject: Re: [PATCH net v4 1/5] ptp: disable all timestamp channels after removing the user interfaces
Date: Mon, 23 Nov 2026 20:42:54 -0800
Message-ID: <20261123-timecard-common-v5-d669cfa034-r1-ahmadexp@gmail.com>
In-Reply-To: <179548551283.3135.17206659598806657887@kernel.org>
References: <20261122-timecard-common-v4-e0db4ab1aa-1-ahmadexp@gmail.com> <179548551283.3135.17206659598806657887@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 24 Nov 2026 at 01:58:32 +0000, netdev-bot+sashiko@kernel.org wrote:
> [Severity: Medium]
> Can a disable that finds the map already empty now undo a concurrent
> enable at runtime?
>
> Nothing serializes the callers of ptp_ocp_ts_enable():
>
>   - extts_enable_store() in drivers/ptp/ptp_sysfs.c calls ops->enable()
>     without taking ptp->pincfg_mux.
>   - ptp_extts_request() and ptp_enable_pps() in ptp_chardev.c call it
>     under pincfg_mux.
>   - ptp_ocp_enable() sends both PTP_CLK_REQ_PPS and PTP_CLK_REQ_EXTTS
>     index 5 to bp->pps, and takes no driver lock.

You're right. V4 addressed final shutdown but left the runtime callers
unserialized. The reported schedule reproduces with the actual v4
functions and stubbed registers: the map ends at OCP_REQ_PPS while both
enable and intr_mask are zero.

The v5 series adds a prerequisite taking pincfg_mux around the enable
callback in extts_enable_store(), pps_enable_store() and period_store().
The latter two also lacked the lock. This uses the same mutex as the
ioctl paths and permits synchronize_irq() to sleep. Permission and parse
checks remain outside the critical section; callback errors and an
interrupted lock acquisition are propagated.

Four controlled sysfs/ioctl interleavings passed in 100 ASan/UBSan runs.
The final map and hardware enable/mask agree. Three additional local
KUnit cases call the real sysfs stores against a registered test clock
while pincfg_mux is held, then verify completion after release. All
eight KUnit cases passed in QEMU with KASAN, lockdep and
DEBUG_ATOMIC_SLEEP. No physical OCP card was used.

> With either one in place, the original shortcut would still be correct
> and this change would not be needed.

That removes the runtime-race justification for changing the shortcut.
I corrected the message accordingly. The series retains the final
empty-map disable for a separate reason: ptp_ocp_register_ext() requests
the IRQ without resetting the timestamp source, so an empty software
subscription map is not proof that the initial hardware state is idle.
The final disable still masks and drains that source before releasing
the clock. The test explicitly models a prearmed source with map == 0;
it no longer simulates a sysfs callback bypassing the now-held mutex.
This is a modeled state, not an observation on physical hardware.

> [Severity: Low]
> Can this loop change the hardware pin direction on sja1105 during
> teardown?
>
> The commit message says "Keep the pin configuration unchanged". However,
> sja1105 registers n_pins=1, n_ext_ts=1 and n_per_out=1, and EXTTS and
> PEROUT share the single PTP_CLK pin. Its EXTTS handler switches the pin
> function whatever the value of on:

Yes, and that side effect was not intended. A second prerequisite makes
sja1105_extts_enable() select EXTTS only when enabling capture. Disable
clears extts_enabled and synchronously deletes the timer without changing
cas_master or attempting the AVB_PARAMS write. Repeated disable is safe,
and the enable/error paths are retained.

The actual-function test reproduces the output-to-input change on v4.
The correction passes 14 modeled chip/direction cases per run, repeated
100 times, including repeated disable and enable/error paths. The writes
are stubbed: this is not an SJA1105/SJA1110 hardware test. All four
x86_64/i386 allmodconfig/allyesconfig builds passed for PTP and the
SJA1105 PTP object with W=1 and KCFLAGS=-Werror.

Vadim's teardown approach remains unchanged: remove the user interfaces,
then directly disable every advertised EXTTS channel followed by PPS.
No pin assignment, pin-function helper misuse, new stopping flag or
spinlock is introduced. The removal/shared-PPS suite passed 100 runs,
and all seven deliberately broken cleanup variants failed at runtime.

I have sent v5 for review. The v4 series should not be applied as-is.
Thank you for identifying both gaps.

Series:
https://lore.kernel.org/r/20261123-timecard-common-v5-d669cfa034-0-ahmadexp@gmail.com
Patch 1:
https://lore.kernel.org/r/20261123-timecard-common-v5-d669cfa034-1-ahmadexp@gmail.com
Patch 2:
https://lore.kernel.org/r/20261123-timecard-common-v5-d669cfa034-2-ahmadexp@gmail.com
Patch 3:
https://lore.kernel.org/r/20261123-timecard-common-v5-d669cfa034-3-ahmadexp@gmail.com

Ahmad

pw-bot: cr
