Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795471637;
	b=ESG1/DN/5FLc1nrJUL5k8/PPHL4A1EztyexfnyIFRgXOZ0fx+C1RF03FdvCf5odk/UjF
	 AQv1O9RtYCA26UGtJ69s3xFkJZCWhI/x4X0k5F54C/oDd5HNblC1hUh2lTP2dHDQRSz5r
	 dxvV1iExMVq0oAfGg7/ONqz0FhfYZ/xeGo+3KuBuKVqisnT1Ilm+j2vfBk7x2asAfO5Pj
	 RCZbjG0Oz6zOg78kvT50bMHW5bHiDzGPbx6tqgyaHkMZMJrFfYMWczrkrqXqnNx//MCzx
	 VXEqfuHvmENjkM9TZF+CiDvPV9CR590K15a5HRoiRy+8ydRauGlI2LT4f2jcWLII+ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795471637;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PNGw6BKvQYAgj1BMgOz7Qn+y/EQCSwQyr9W2PBjsi0U=;
	b=KM14ztRpwHKtX2XJ68/JPJ279dv8/YyjGrHa36Xp/stzgmoSR+/Q1JWJL6merrKuMBVm
	 wRA4PkTbU7Lx5WoY/000rT4E97oIT8AI//KWMDXoBTvLiCSd9ZXK6wbejhgASLAEuD/Q/
	 RONrm6YtE76Uq/KdmmTSnXPwdeAtBskG/ThlCc+MwUOyMe1IdB7ze8pkFVdR0cvD/2WvG
	 T6+PsjannS5TlOOdZdqpQYKbDcK/viLWcbRRZwsaJyh7w4lOB9UMnh/juEPfGOleHwaYn
	 Fe3wnUaWgKC2YiOn77Mn6j7Jmq2TRyxfHSZ2d6M88vLZmJzt17TilOUqD8oz1QlrP8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kmJcOmkB;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F324A606A321
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 22:07:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F324A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kmJcOmkB
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3863db981d4so5145916eec.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 14:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795471636; x=1796076436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PNGw6BKvQYAgj1BMgOz7Qn+y/EQCSwQyr9W2PBjsi0U=;
        b=kmJcOmkBJB1O0R575Ee1O/kTtdwbrHWd68mBSDS4QEYZK8aI+BWlCV6XOloj4RY4Wn
         csDMjid2fzvMnDpX1qUZfttKESyTMco4+0ChRsU9I756kR7j0FfQ5wA6+4zGzSCoF9Yl
         Wj3fwzyirAPkgbHAWTr1Oxpq8KkM0VL3ykspDHGiXOkWKfsJDeKwzEEt1iw8NIRHV7KZ
         2Bmo4Sh3yz9JYZw/1Q7FLmS5+eXQyQzBe3W+X4uJ5GBKbkPaKuYu3pkvARe+MhdSoR5P
         ogiXRnIBd0raj37s63/egeZhdP3pOIV2KMHz9P0AyXl4phm5mkZ9gKC++DpLxT8gn8Zn
         sngA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795471636; x=1796076436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PNGw6BKvQYAgj1BMgOz7Qn+y/EQCSwQyr9W2PBjsi0U=;
        b=TMKWWzVsUVPO6TT+HWgYjXTtwkOzGO5xZjyjh1RcONbwQ1Q3IMrWXdI0gKcjSiDYIt
         Cg1fOSjFEJSawiwJIM0rCQl5uTgHOzUZgoit8mRPmAZda6lMAipLOrUIposlZe9/vbyh
         dcSWjxMsXczGLBWBRL3c3+qiyWSy+Sbxgx/MBmk3QkabR5c/SvYJMuXanIpzWaIFkiVB
         USsgfp4QusvhiT7nUzkReXkVYrslHZd2M6e7xCAO+gaVwO/wdbxFUiT5x9onjuCyB5oR
         FydKAApkahDQ2S4+/dkVOb46kLifenpxdvt4e7nxmXwK4ulqIrCv5nEE+NTSteazxMEY
         846g==
X-Gm-Message-State: APuU4Z/8xt+QIw346XpGoYcyL3VZXhmAjRV9kZVpVB9n2L5RwdH2NndH
	tUbNfk1xfhy298UMKmwED4Xe4jowsAHqGbYN+3N8U6/I5vZ6dI22lHPpSWFESi/v
X-Gm-Gg: AZFdTZcq0kBn+Cv500/KcISxm8UAhVJ92yMUmZwx9SnE5C54GsCFV45pz0CapXl0CF8
	UNFjI3z5G8oQ3atxZYRzqfAbc5RTmx/LLAWb5MmUtFCxpmGRQxcVImDtRstpyPwol6jbX634Je0
	UG4yn3c34BfA8rEcs6mvFnbnJs4N7s0rjOoGKtAYHhjlE54ZCaPqusrooTOZawg/w7yd+n+3s2m
	EXlycmQQyGMembsmR6bP6tlceXl91+oNXSW3SMTRAUv1IomT6HNKdhr+LXopSmaR0LYqTn+3FlW
	GfbBwadD3A5ilJzsw/k7L8Rim1f1wBbTVNYAZHBeJjYEDhtbDFTYuY5oUCW4yG59XXGJc7xjzBp
	/6XA4z9ttO1n9uSxabpjc5w9h2hGTx8Hj+A0t5mkaCxG50Lw7vQaOSNm04Xz0fP5klgv1t+FMUq
	qJqM4mYvAwb4CdP3DSqO4ZVjupVQCrZoKfX1BBc2ksrJeKiS5lP1N6wpzUuZN1BYBvcJrbTJcrV
	T4GU/8IPuBwtUpeJ+kGRQC29irM4ZA4bV+KWzNve/609I0NDy7HT6eikN9SpGN+8N6SE2iF17Hc
	HvDWhN4/mkjM2vQXiYdBGQ0zs3LA6yBcrSaPmRv9M5t7X2S3Vtl6GTAqV+ZvfC7+Fy8vcoZN9qL
	MPNuz8Itune26BeBHglH5ho5+NE/R
X-Received: by 2002:a05:7301:6181:10b0:386:b2ac:1f17 with SMTP id 5a478bee46e88-386b2ac2832mr4007770eec.7.1795471636069;
        Mon, 23 Nov 2026 14:07:16 -0800 (PST)
Received: from Mac.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm15124831eec.18.2026.11.23.14.07.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 14:07:15 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org,
	vadim.fedorenko@linux.dev,
	richardcochran@gmail.com
Cc: andrew+netdev@lunn.ch,
	arkadiusz.kubalewski@intel.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	jiri@resnulli.us,
	kuba@kernel.org,
	pabeni@redhat.com
Subject: Re: [PATCH net v2 0/4] ptp: ocp: fix timestamp teardown and DPLL routing
Date: Mon, 23 Nov 2026 14:07:13 -0800
Message-ID: <20261123-timecard-common-v2-retire-ahmadexp@gmail.com>
In-Reply-To: <20261119-timecard-common-v2-078fe69f33-0-ahmadexp@gmail.com>
References: <20261119-timecard-common-v2-078fe69f33-0-ahmadexp@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 19 Nov 2026, Ahmad Byagowi wrote:
> These fixes address existing Time Card teardown and routing issues and
> are independent of the WiWi board support series.

Please treat this four-patch v2 series as withdrawn in favor of the
five-patch v4 series posted on November 22. V2 still has all four patches
marked New in Patchwork and its implementation remains in the CI pending
tree, where it conflicts with the replacement v4 teardown patch.

The replacement series is:
https://lore.kernel.org/r/20261122-timecard-common-v4-e0db4ab1aa-0-ahmadexp@gmail.com
https://patchwork.kernel.org/series/1219090/

V4 follows Vadim's requested teardown approach: the PTP core disables all
timestamp channels after removing the user interfaces, rather than adding
the v2 stopping flag and driver locking. It also addresses the selector,
combined-route and disabled-input review points, and includes a separate
ART 10 MHz frequency correction. Thank you for the review and for pointing
out the shortcomings in the earlier revisions.

Current validation:

- All five signed v4 patches apply cleanly to net/main 639a75a3539f and
  net-next/main 57f165ff2f30. The resulting affected files match their
  previously tested common-v4 integrations on those respective trees.
- The ptp_ocp.c blob in the reported CI branch,
  net-next-2026-11-23--03-00, is the same blob used in the local conflict
  reproduction. Reversing only the four posted v2 patches from that file
  and applying v4 succeeds and reproduces the tested v4 dependency file.
  This is an affected-file application check, not a full pending-tree
  build or a claim that public CI has already passed.
- V4's public 32-bit, allmodconfig-warning, Clang and checkpatch checks
  report success. The contest check fails on the pending-tree conflict
  at ptp_ocp.c:2559; contest-hw is blocked by that check.
- The focused source-derived X1 test reproduces v2's -EINVAL after an
  input-direction change. V4 passes for all four connectors, including
  the DPLL get-before-set path. The ART tests accept 10 MHz, reject 1 MHz
  and read back 10 MHz for the fixed default. These use stubbed registers,
  not physical X1 or ART hardware.

The focused results and relevant v4 patch links are also in these replies:
https://lore.kernel.org/r/20261123-timecard-common-v4-followup-x1-ahmadexp@gmail.com
https://lore.kernel.org/r/20261123-timecard-common-v4-followup-art-ahmadexp@gmail.com

Please remove v2 from the active queue so CI can test v4 without stacking
it on this obsolete revision. This status request applies only to v2;
v4 remains the series for review. WiWi board support remains separate.

pw-bot: changes-requested

Thanks,
Ahmad
