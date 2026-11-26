Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795711285;
	b=QUkrFIxsCYDot5/RC/7UjcG2K6RiuCfQK4UXCa2RVHV6CinIKi0CFQS3dAxKcVYh4H5l
	 0vxX2xJZwqe8cN0qhSUu9hn3FpcrXVYn8vj8whCVkM4AVaX/QPw4EdbwjTIffHsjT15Nz
	 ZaiQQ8gwbDP2o1OD5TP33wAbU3z3DBEY3JLf7+iZOV4IX8EQ/B7UR7OB/uUNw45OiFTBc
	 t8NZ+UY4KNhJWeGzhcSIbhoBng8XPgu74njnY+C8oxKR9JUF5dBr/93yuE/+uVIo6Xkm3
	 ZJ0PpJTaHOHRgsIdEbAvSgcNORfDJ93e+4QZ67bvC+fT9TGdzez5jQr2xVrPmRYDorw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795711285;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
	bh=/kbGcXcPM5k6PvUxBCaFi5aQkiCgAQDPw2BOeRffUIU=;
	b=W7CIeM/p3QMhbvB+LL1vo4SZRnQKmPFMCTHnL3uT9ny12SQzJ5GEAvmZLG0AzMk3xOX+
	 NTWqKCpyErXiJL4EZgX5lgiYBlV5cSKk8wCQgtY8xL+DXPE2cZE9lEV7wN2pk0K4i8KXj
	 qGnt5L7WygnMx0SsrhsCz+8L8j990NAs6zhKlI2p/x+saRcO7vV9el1Ol5fUzWHpWwvnn
	 tJnOxxMvpLbsZifkks4h/I8dKHD52s0gjRmuL5fJyPHjAZ7Ek/koetebmsi5VJCPB0EmA
	 xEUZA/T/cujztUCayuQC1QID2xLyS8zO+hV9ZXCDgufdWk+hATnG7FRLPH9j3F9L1sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=viNVKabU;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568F9606A329
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 16:41:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 568F9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=viNVKabU
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-386cf1041cdso3688451eec.0
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 08:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795711284; x=1796316084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/kbGcXcPM5k6PvUxBCaFi5aQkiCgAQDPw2BOeRffUIU=;
        b=viNVKabUYYeKjugVSLKrllN42up4aUrX9B0f01M5xgasJQelqKP3rPPO7s1XHaK2XJ
         cyBSkcdxE0ZdhMjjysPWmPYGHgvRQg1Lrud6gVaRIKmsx4Q53Gcv6alyNIFkENnGCcFT
         bwdtrOWM7VVjfOXi4ptjFUtzgJ1mfemXvEW3CW3saos9+SC+MobkoEaxMSAr1GpA3tcC
         5kN5vfI+UI63jzOLXOndfZOKsbqfLmOsZORT2vwgdtgEKpktCd+XAch/5LGr8whgx5wx
         v3vk1jFna+Cv99rPMRVUyFtleMqEyZ9Ah/92WlunizS9D7iI7VfH1e5Rvou7NXPayoVc
         TRHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795711284; x=1796316084;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/kbGcXcPM5k6PvUxBCaFi5aQkiCgAQDPw2BOeRffUIU=;
        b=e6HuYLVWK2y+v/cb+HQuX0wcz94uzV5eruE/yhWYEVTxpZB+wQZXm/Wb8BNjDUKSRf
         BYvaWDXaXcvprB6oMe9v8Sr5w2RghWknQwLjF+JZsVsD+00CLp8x7UfHJwzvRWplKeRV
         aua0MirnYq7rwrTaDKGQ7YK2WEx9rJKyFXs7OHAvmMPzT4U02a5ZpYvq8g6PDlPkrezX
         oI3BmzWQgpYYfR6QVx1Go0/KN5rVf/t+v7vLUskv3qXMC7GD4/f+S+G+mKPvX42MAwhu
         PeE+HzpkV6AdUpPw8Tm2HVELKs7fJJPXPZwREQVUvlPkVU6NSAUkyZtEoCXryrk8IdN4
         qqCw==
X-Gm-Message-State: APuU4Z9mklm4lVN3gGw3Tn9UzHm+3t5aHl1RLh4+ezm69ReLEdEze2k1
	jjr4HClH8AoWAOEyooJjB5ZILZNlafF2Wa6f94P/j+u1+hA+tEMCHTQ4MwuOjXsZ
X-Gm-Gg: AZFdTZehNfm60vW096oH31VcWHjEC4EKtNcknlFpb5+JbczbRh1fku4EV7b0CGa2Xpu
	jo1pTBU2RhMSaa/ZACi7FHQSgCmKx194uRcQHteWt4I4qZ+sOFd7z/gAp0ZKndPbLlNQ4/rH5LQ
	hJ8cKkN3Hx+uA/4YiIVwDOC0mNcbCyO7BVAEND3y+YlYf7mnW1JUeqODZ7/oLn6GxXj3b8n+Buf
	uOA9to9mll1vJkigXnJJh6DMW5IG7WZ4cH1f/aP1pomcEHKo3++xsTLMLjmsWqnwla7fVB/12PT
	Oo90JpbhljbOSE9JAogtMRiOA+BKinJT9fmlGeZAo3miyCwSSQekZ9NKxQRqcSz16aukH5ABCKQ
	OTQZ6gp3TpOME4pgiCVSsKQsM/vggyJz4Q1zE4fDLaBRlP/wA79mXGFo/5PgczJ29/ghPoxb7yt
	sdfkEgHLFav/BoeXSyMNrNjXxT7hR0yy+3cFL4tTgA/pilYGGrTuU/rw/E4B/pp3hqivuibpIJX
	xGVJh0JxoKWET198lWZRS2V3CYN5PyZv+uf/46Ee9rHFy8gYZrw3LzQPDFRFsh8Gn/wv7RQ1n+Q
	3SQ1xL8upRFZimg/zSLhnT6WadMLWPAJIUMlwIDTagQliTsu0xf5PsseSiDY84btVIBUpB15dk0
	M3nkzkV/D6nPbDHInf1TF/uYf0OKxlslHg/Lwjybw9NHOHTF2X8WjPNUBbsYQ9pRjCd/akmyX
X-Received: by 2002:a05:7300:d509:b0:385:ac93:91f4 with SMTP id 5a478bee46e88-385ac939fc3mr27432113eec.26.1795711284385;
        Thu, 26 Nov 2026 08:41:24 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3866f299d0bsm55903706eec.19.2026.11.26.08.41.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 08:41:23 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org
Cc: richardcochran@gmail.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	vladimir.oltean@nxp.com,
	vadim.fedorenko@linux.dev,
	andrew+netdev@lunn.ch,
	arnd@arndb.de,
	john.stultz@linaro.org,
	rmk+kernel@armlinux.org.uk
Subject: [PATCH net v6 0/2] ptp: serialize requests and stop unassigned timestamps
Date: Thu, 26 Nov 2026 08:41:20 -0800
Message-ID: <20261126-timecard-core-v6-0-ahmadexp@gmail.com>
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

This PTP core series serializes the sysfs enable callbacks with the ioctl
paths, then disables every advertised external timestamp channel during
clock unregister. The generic teardown patch changes only the PTP core; it
does not modify ptp_ocp or another clock driver.

This split follows Vadim Fedorenko's review request to keep PTP core/PHC
changes separate from driver-specific fixes. The dependent driver series is
prepared separately and must follow this core series.

Validation: strict x86_64 object build for ptp_chardev.o, ptp_sysfs.o,
ptp_ocp.o and sja1105_ptp.o with W=1 KCFLAGS=-Werror; source-derived
teardown tests for all six EXTTS channels, unassigned/zero pins, interface
removal, callback serialization and IRQ draining. Tests use stubbed hardware
operations; no physical card or switch was tested. No KUnit run was done for
this revision.

A coding assistant helped identify the gaps, develop the fixes and regression
tests, and prepare changelog text.

Ahmad Byagowi (2):
  ptp: serialize sysfs enable requests with ioctl paths
  ptp: disable unassigned timestamp channels on unregister

 drivers/ptp/ptp_chardev.c | 14 +++++++++-----
 drivers/ptp/ptp_sysfs.c   |  9 +++++++++
 2 files changed, 18 insertions(+), 5 deletions(-)


base-commit: 4392bb809812ac79449cd0cf1f5e00469ee102d1
-- 
2.54.0 (Apple Git-157)

