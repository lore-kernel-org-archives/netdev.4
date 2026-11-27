Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795807240;
	b=Hfl4NR1CkkLd602iveu7Qc10OBI7a8BIyvrDZdNPqi6k2uBPWxjNgZJyZTItYXvJtIWa
	 UQExo2WwZKVyoZ8tqkZ6Akhoj2FX0QOpmH6lEBOsBXad4rFYNRW8qyt2TYmcVKL4/VQFw
	 lYnsuqquIocfjDQObVv94PKAcySSoPVqbWF0b4TqZ7rqRQpsXtcjax9qnqnuHEqMvAVNd
	 c6IbmrT/sd1C211QPCT57+uZzJvx61ZR6d+Hk+mJ4ImeaYlaM0s+6k8Rt3Xk5rPTCsYMn
	 eZc2T3NTS8cFNn6hFKRCmbXttus71XiaQLC0e8+8A7DFS9U+5xKFNOU1NjugD6yqy+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795807240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
	bh=zYNKD0PPd9vD86TSNPUd1gmxHyE0NUk1sieq2ZxNy6s=;
	b=m4KqOhXATr8vlzAcyEKtAjvdrt2Grg7kseeuUpKfqVvReu5BBDPsx+f/0W7zqV7aWRF1
	 EDw4aqf3NB7TrGmlp4il8jjNdPtJbZ442wLC3CeXpohZAEcPtrI15lsi+1C1XXH97jdJx
	 gKplZKQ3bBLYR+yWPqBGjMIgLpsaEO5YQza+8UUzZO5zV0yYww2kz5/5ktXGVE9fkhYGw
	 /oyIH/jSvMtJsBnOZIhH1F1xa8anvKXQE/tEA0xh9LWHdeVGKJrYaSpAT6gSdWkPkpPqm
	 lO83mJx+7DdL/6j/Nl5E6xsJAmXKPe2s1+TNHjgQdGQ0PwPn6LpXDsHeJ9ERqqnetvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UuflXoHw;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94084606A31C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 19:20:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94084606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UuflXoHw
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-38699cf08dfso10730005eec.1
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 11:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795807240; x=1796412040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zYNKD0PPd9vD86TSNPUd1gmxHyE0NUk1sieq2ZxNy6s=;
        b=UuflXoHwfIGbzI6mVaASYKxzEF6N0VX+cPeQTKCgZP/ZzAXIrYUp5V7JwpJ9C5dvm8
         IT7gZCmwvTS8nYlnY0aBHSxQACISxy1I6QI6R1tJiSiO+Eynw6c5LZxw9dL09f3DI9p7
         R1rT0Sl8HNU8ipNJqcdR22FhOBPpcHz0qdxDmLVj6WEXfu8lvA2tYvw3ME8PBOyOC6/1
         j7LN4l/wT/uJbq4qDx0xDgk0yG2JShh0ifmQ70MgeaajlHOi0ygRYHKybIslHUwNWU0q
         8Tn0KvYVEdhgc/VY8uPZMz+x62m2s5Mc3zsBEDk6iSWwhkk6/sqSM7uWZrev59nio+UP
         OweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795807240; x=1796412040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zYNKD0PPd9vD86TSNPUd1gmxHyE0NUk1sieq2ZxNy6s=;
        b=o8+SzjGCVgt8tH4FHLISh/wBkakXUVPQ7iMIEb6tl42ffEfhyn5MGGHluMc441MCJK
         pG/Ow5/z+Ka4QHB48hTbvbIJJNuIgJlCLBK/KW1VQkB6orRzXgZGnxax3ER6xsNHLyHs
         8X0mpjZgjRmyWGhQLnHT4FAcZ+Agx43f2BewUejGs5CKVewO2JkboJEiyKafYk4iaffW
         hJO+civgqcBCsQnI5hdwcPGbL3dnPGuVhYDk14Y966zDvuTMEVvJI0Bf9YWHlWeQBY1H
         MONae9VFCNo023BPvNXHhCke55TWdgdo1PXBGBTNUjivWHdSGqDWWlJTiz46yP1V0l9B
         pQcw==
X-Gm-Message-State: APuU4Z96CK1fS8oS/d9k/utsNsP37dqglduTnWjyTzi53hdPyybcF+RK
	V/DryjiUiy45lrfWjmXtTYXbP6F3AMTAP6lPUZYAb25CguCA8mSATVbyDG9WcRTzNVo=
X-Gm-Gg: AZFdTZeST9VAth0VII7Ewhyfqh8fOtdyvanoyiyF7fNlkpv4hsvHJyTyyr2Mnx5TXVY
	B7GgOW1y0oI/YTT4Um5V1yM/Ll5/eu6DRXdHj7xwMhBFKGWWJ+//eXKoG0hIIWsVzX6ZZ94mUMH
	fQqqQr6YJh6SqfO2LWYiEVsmmVjtmAIy11Bzt6IMVSeLMoftOQqdjbgTjX4HmppgFq3X0Q4EMg6
	tMue0KEKeVwIjRFqCaf7DGfbhq/VtuC6MUFWwF8NA5aR8SstifqunmorISrUdhacK1dJLLTpVmp
	91S9fiiD1QfzYPeIzUaFDv3DPxK2DJ+2/naTe/H4NAofmELFRXJeBEEFCifE2OOmm6AkFd06gUv
	3DEYO818cMdf7U5i3xlIywa6wLW09RfLLpWPSY2fDidc5mughmDjUeGjv3gG5mSZ43e/3o/5I6q
	v5oY+qq0kq2od2E5caqxx3PW7Jl/5nTQrj0rItVIvoz68kROQqHKvZsfeu3QkyyTF7bQT+Dzqv8
	VOq4bTZJtr+cjN61cBjw/2zgbvZtSqP/jqv5+J88bTmO+31668xoukQ+UGuqlHQ8TMdpFOGeb1H
	FQ5U9+LOkEexMzV/GOX6h/F9joZe/Sz1QLK28b92xjoBFxrk6qUJgsIlwReoUcV2gTpd6fUbaCo
	LgPk6+FIFk1E3QjVOjTlAlje1HaP4AqZmV5mm71eIDvSDsgVUA0/zs9m6oSsV29btwllcuGVvly
	bQmroCwKM=
X-Received: by 2002:a05:693c:8955:10b0:386:9cae:abef with SMTP id 5a478bee46e88-386bf39f8b9mr12292259eec.36.1795807239592;
        Fri, 27 Nov 2026 11:20:39 -0800 (PST)
Received: from Mac.net (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm74438668eec.23.2026.11.27.11.20.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 11:20:39 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	rmk+kernel@armlinux.org.uk,
	vadim.fedorenko@linux.dev,
	vladimir.oltean@nxp.com
Subject: [PATCH net v7 0/2] ptp: serialize requests and stop active EXTTS
Date: Fri, 27 Nov 2026 11:20:35 -0800
Message-ID: <20261127-timecard-core-v7-0-ahmadexp@gmail.com>
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

This series is limited to the PTP/PHC core. No driver change is needed
to apply it.

The sysfs enable callbacks take pincfg_mux, as the ioctl callbacks
already do. The core tracks successfully enabled timestamp channels
under that mutex, including requests without a pin assignment. On
unregister, after the user interfaces have been removed, it disables
tracked channels and preserves existing cleanup for assigned pins.
The tracked channel indices go directly to EXTTS requests, without
changing pin assignments. PPS is disabled last, before source release.

Changes since v6:
  - Use the commit establishing the enable callback locking contract
    for the sysfs Fixes tag. Clarify unchanged error handling.
  - Replace the blanket disable loop with tracked channel cleanup.
    Do not call into drivers for idle, unassigned channels.
  - Keep the existing OCP detach and shared-PPS logic untouched.
  - Align the author name and coalesce the commit trailers.

Validation (local fixtures, not included in the patches): strict PTP
object builds on x86_64 and i386, allmodconfig and allyesconfig.
Source-derived tests model teardown, last-subscriber IRQ draining,
idle, failed and already-disabled requests, and unassigned channels.
The host fixture uses stubbed register and interrupt operations.
Nine local KUnit cases pass in QEMU with KASAN, lockdep and
DEBUG_ATOMIC_SLEEP, using real PTP unregister and sysfs callbacks
with a test clock.
No physical card or switch test was performed.

Coding-assistant support was used to review callback and teardown
paths, develop fixes and local test cases, and prepare changelogs.

v6: https://lore.kernel.org/r/20261126-timecard-core-v6-0-ahmadexp@gmail.com/
Review: https://lore.kernel.org/r/5d6416ea-d927-40ac-9424-dade40191373@linux.dev

Ahmad Byagowi (2):
  ptp: serialize sysfs enable requests with ioctl paths
  ptp: shut down enabled unassigned EXTTS channels on unregister
