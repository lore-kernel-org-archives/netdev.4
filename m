Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795560755;
	b=Bx1ju+8tbOYt3b0Rz9uUJ5Tjid13Wtxhh2LmIUpOjzaG4qw2yTO1hylksv96F9HIFouO
	 E8fyvjTLucwWpwcOtoOOMYlDxhvLMcdMwT1I3oQEC2mhYsVl4ivieBSLWfMg7F4IYAXUB
	 g646a6UfmwB2IZkYT6U4riCW3T1VcMzyX1J/bJBcyuUl7r5HTL2kzKOrKw4/pV81Vj+UC
	 Fn4ri10S8TkvChj3niAAGxX6SsEsMuOnMW8EXhIEjRNrTyen9dRkWzZl/RvJYGi39QpYv
	 tFdQQT0BVxBoFgvAFRdAzwFzOGD3fktLMdDJouiZllmioKM9rurit42rWO1c8himKvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795560755;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=/SyEXi/OQvzWoBSBKmQ6Lt30X45cD3FNvhUqDKHa2tk=;
	b=rqkHfhSzwyswKNaBCWOOvwCdSObyr+OCIWq4uHDoSD6J6gPBBTDR916FcJEA+SMLAdwl
	 MdZSRaLBqikGAb4zGR7GZzn1y0WqLEkQAqwvTEMHqCatTqGOhChOntTe+6H/2DGTEez2e
	 J2/CzWliQjR/Wfc2lxLzaOQoI7clLI8btZQXPTRwfN1gUvzqnhpveLh/LrvggOQLZnsZG
	 sAETxoO6h1Mx7hCu9CrUuoOqKrYCBOv3Y5wjPpUScyMigzZ/dkdeTFPbXur5QfPsbq6cp
	 udxFpW70RyE+dvkXY6E7EmtJyqAj7uruxirCtNwNCT+kg+K4Ed9jhdPVg1zFmxf532w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wYub2fvf;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA52A606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 22:52:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA52A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wYub2fvf
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-380c28f9e35so6242926eec.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 14:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795560754; x=1796165554; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/SyEXi/OQvzWoBSBKmQ6Lt30X45cD3FNvhUqDKHa2tk=;
        b=wYub2fvf8lYYUpWuZKqpj2o1n/PyO3afpBhUA9MF1qrc3L0qOGMYQHFbi1slxGBCh2
         hA62nsRHZCDZ9IpcAYFp1j95wnzs8dUxCY1/kXLcY5ZryDWnD2tuirqSR50+r89YkDIE
         1lKa4Dy+qUpqOcUuO82DlaLvJgi0c+kHBQO5po0byAiUzXQffuFpJQ2T59AOfus8ABuK
         w1z5ssJjqEOtUY2wSWPiATnF1TQurVbf1D05vnxtH7wD1sX1WkhuLJxmUS/vUsKgIXeM
         dxJeA/UyBFXHt6rH5VzFx51Un1bFMxZrkEpppUZ+qgzQkEURUHgLRoRx9Y9NXMUNEbiQ
         /5mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560754; x=1796165554;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/SyEXi/OQvzWoBSBKmQ6Lt30X45cD3FNvhUqDKHa2tk=;
        b=x8NV2N6aULjzRwKilWHgDK67cAxN0o0LoDH/DKF4zJcmEjI6DUinAVogL7wjirHcXi
         PyoW3M22EJTombR1aMOjmbuq3vWF99P9CY50phff9vtMPPOoMEy8OipgYKIEEoAGpQQr
         F5shQSB43Y06dLcJSMPegma3SVPNFAm4xZIhU8b6XrQQGDyJv6PGlxi0BgVdgY0WDU4Q
         osTrn/SwcGzmEjiMhcY6jWibTOf+12LOaJVVNMKsCS8blNhnnpEx7AV6G6IpBM8J1P2q
         WzGvParzHgwPC01mPLenfIipKJpP+IoXcxkAighjs5rWoRdPrRntQ9wTvncH3SBpOeMm
         MsTg==
X-Forwarded-Encrypted: i=1; AL+hErF0kPASPQKo82xOUZvViShjO/iv/LCNnGy26UXuhn3xApdVRaztfkxVGHS2Alx1haIJlXY8CI0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GFj+8yHXRnDn6AG3ZtS79BUsk2xk9oVE3lM0ZuAc9sJfIeD56
	23U0140pQ6uStNnMHNY8Y1NZ3izMWpis2vT5kW3d7AW4mw/47OQ1Q6pvNjLkYnjL
X-Gm-Gg: AZFdTZdJVNfOVIyKet569R+xPTfsE1tywa6jwQVSdIqgC6ahFzhjpbHIDd60HilvdTn
	tOww9/iMwoSIIkDvv9arRzpNOTGZfoucbYenpGOTFTcSG3GE9OATnqH/BTZ3lxv8Z3nvQ1KydDR
	q58hvakrXbup5zzrRbjIxeQ7r3B7RyU/UQFJtUiUK7x4WVyAr3R0yJ2OwwCm2Bsaqo3tEZnLbY9
	IhWr6WsQL1DQ6B4IrTLfX5We+XUklbPCZESc8qAMagV5hcVzNuYS5AKC+fEdxJrb+1Yk8VPIpG8
	n+3yGvrnbWpMv6ZvJzVDi1FyLtYHJ3IeDzCkQ1khFrQkip6sUPK94lyinCmX3UHsE7nIOYLNzpG
	FgxUJy9MUhyzdpz7kvZqdM3iDE+Zsry8Gxs+wDMdPqW0COHAz0YNRm4SsUzCBeaXstv6uk4d6bE
	hmzbv5Cxj7vTcRNWk/WVA5MfWX1nc3JO4NvJ3r1BMgfQHRci5a/suvHBMME2I4HO82TFqnhOo8e
	MwlYI69qDx9+Yj6lv+C0n+E4l7h7Kg1qRMOCR/nfrGU5BnZztT5lNNXMjBbM3sRwYmsFfYZy9vx
	ztrhE94zZX8Tou0L5nDZ0ksBcH2NCYGRqyo9JyntG7ZGLDzXPDVFCiVcK4NrLgINHL+NTo936NS
	pM45qsOHhEQstEHz8q1NJcFx+4axWbrGLazyAAswNStzeNepIDVANRIKueg3gGZ8MeVyaKXEJ
X-Received: by 2002:a05:7301:d804:b0:386:b076:a940 with SMTP id 5a478bee46e88-386b076a9e4mr7629466eec.26.1795560753628;
        Tue, 24 Nov 2026 14:52:33 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd46c5sm58306497eec.11.2026.11.24.14.52.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 14:52:30 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch,
	arkadiusz.kubalewski@intel.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	jiri@resnulli.us,
	kuba@kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	rmk+kernel@armlinux.org.uk,
	vadim.fedorenko@linux.dev,
	vladimir.oltean@nxp.com
Subject: Re: [PATCH net v3 1/4] ptp: disable all timestamp channels after removing the user interfaces
Date: Tue, 24 Nov 2026 14:52:29 -0800
Message-ID: <20261124-timecard-common-v5-tests-r1-ahmadexp@gmail.com>
In-Reply-To: <179555822342.3135.3643426123083976487@kernel.org>
References: <20261120-timecard-common-v3-33316bf475-1-ahmadexp@gmail.com> <179555822342.3135.3643426123083976487@kernel.org>
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

Thank you for the detailed review. These are valid concerns with v3.
The current eight-patch v5 series includes the runtime and SJA1105
prerequisites, and I have now published the test fixtures and results.

> Does this widen the race on pps_req_map at runtime? Before this patch, a
> disable on an already empty map returned early. Now it falls through to
> the register disable:

> The pps_req_map read-modify-write is not serialized against the register
> writes:
>
>   - extts_enable_store() and pps_enable_store() in ptp_sysfs.c call
>     ops->enable() without any lock.
>   - ptp_extts_request() and ptp_enable_pps() hold only ptp->pincfg_mux,
>     which the sysfs paths never take.
>   - ptp_ocp_enable() takes no driver lock.

Agreed. Fixing only teardown did not serialize those runtime callers.
V5 patch 1 takes the existing pincfg_mux around the EXTTS, PPS and PEROUT
sysfs enable callbacks, matching the ioctl paths. That mutex covers the
driver's subscription update, register programming and sleeping IRQ
drain. It avoids adding a second driver lock or a spinlock.

Four controlled interleavings pass in 100 source-derived runtime runs
with ASan/UBSan. Three KUnit cases call the actual sysfs stores under
mutex contention in QEMU with KASAN and lockdep. Removing each store's
lock makes its negative test fail at a runtime assertion.

V5 patch 3 retains Vadim's direct-channel teardown: remove the user
interfaces and drain active ioctls, then issue EXTTS disables for each
advertised channel followed by PPS. The final empty-map drain has a
separate reason: an empty software subscription map does not establish
that the source was initially idle, since IRQ registration does not
reset it. The prearmed state is injected in the model, not an observation
of a physical card.

> This switches a pin that is running PEROUT into EXTTS input mode, and
> rewrites the AVB params table over SPI.

> Is this reconfiguration intended?

No. V5 patch 2 makes sja1105_extts_enable() select the pin function only
when enabling EXTTS. Disable still clears extts_enabled and synchronously
deletes the polling timer, but does not reconfigure the pin. The fixture
executes the actual functions with stubbed configuration writes: 14
chip/direction cases, repeated disable, enable and error paths pass in
100 runs. Restoring the unconditional pin change fails the negative test.

> Where can these tests be found? They are not part of this patch or the
> series, and drivers/ptp/ has no KUnit infrastructure.

> Could the changelog name the hardware that was used, or state that
> ptp_ocp was not tested on hardware?

The public package, pinned to a Git commit, is here:
https://github.com/Time-Appliances-Project/Time-Card/tree/c889b25e9ea175f64dd811457f8f2c3d29512e45/DRV/Linux/tests/common-v5

It contains the source-extraction runners, complete C fixtures, KUnit
source, Makefile integration patch, KUnit configuration, build commands,
the submitted v5 patches, checksum manifest and result logs. These are
out-of-tree review fixtures; the integration patch supplies the missing
PTP KUnit build entry. The documented source preparation checks the
complete resulting tree against the exact submitted v5 tree.

The original run passed all eight QEMU KUnit cases, four targeted
x86_64/i386 allmodconfig/allyesconfig PTP/SJA1105 builds with
W=1 KCFLAGS=-Werror, and 100 cleanup/shared-PPS model runs. I also reran
the published model runners and all 20 negative variants on macOS and
Linux. A fresh checkout of the pinned public net base plus the supplied
v5 patches reproduces the tested source tree, and all eight QEMU KUnit
cases pass there too. No physical OCP/Time Card or SJA1105 hardware was
tested for these fixes. The userspace models stub MMIO, IRQ and timer
behavior; KUnit uses a synthetic clock. No physical unbind/rebind,
PCIe interrupt timing or SPI validation is claimed. V5's messages state
the software-only testing limits explicitly.

V5 series:
https://lore.kernel.org/r/20261123-timecard-common-v5-d669cfa034-0-ahmadexp@gmail.com
Patch 1, runtime serialization:
https://lore.kernel.org/r/20261123-timecard-common-v5-d669cfa034-1-ahmadexp@gmail.com
Patch 2, SJA1105 prerequisite:
https://lore.kernel.org/r/20261123-timecard-common-v5-d669cfa034-2-ahmadexp@gmail.com
Patch 3, timestamp teardown:
https://lore.kernel.org/r/20261123-timecard-common-v5-d669cfa034-3-ahmadexp@gmail.com

I have kept andrew+netdev@lunn.ch copied here. The v5 series used
andrew@lunn.ch; sorry for missing the netdev alias in that posting.

Ahmad
