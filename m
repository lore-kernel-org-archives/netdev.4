Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794947222;
	b=q+OFNOF6qx/3QMZ7tSsJ6A39CyBMT/icnQ4DqLK7397cobsNzaFDxldsTqYo/JdQmi4W
	 NgqxwwE1uAKg++cjdmn2fpiOjvTP5v5/1ZgRUFdH0+P0YOrh8+IUkyonJG94TCRkIW58c
	 T8rDAbb7pYQ55oDt+oDc7136z0DkE+bqe5Ck1FGzAelBEmyIisknJqZVT6Yctz71NG1aK
	 mH4FP/ZW3GSKSOKb6Xz1DfwitdGa9O/PuV0j7TytyOD6ADPW9jhWgSy8LTMPfvgYi3TJK
	 UYfLyb2XJxlfia126q9lU9gMPIoi/oF+sJIFaCeK1HNdX3uSKqxRk8CjPssGdLRs/Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794947222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=NtQRzFm8cV5RodGkfpCY5dyh1Ht76XcmhOuef9Kv3NM=;
	b=RrSpkao7epIbDvvg4BGy2uXQ72N4ZhK6SFsnvvCAF36uKqdp+UfAblXllmE0wnfcLFS9
	 rqQ6B8qLqKpC1wsW/79YE2pbf2DQTsBIndbPvGEOo/4ESgxlvRycjgxeeqUJ3uwIj9tEk
	 86CTIFiwru4h76ivII0SNDRzRr0j5T8GivYp/n0fW/box43kWsbk5fDyyY1EST6PSlYJI
	 C8oDsjHaHQKeYG5g5Pveb8cQjAji8qCd4uqXkPT0EAMJF7D36yDOXjx/G4SBF+RkbvAmL
	 mNpCMOjMKFP14Y5oGxWxZMZbEVoV6I/G8MHESaPI191Ensous+4+2dx4NcWXkU7koxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=xmousse.com;
	spf=none smtp.mailfrom=xmousse.com;
	dkim=pass header.d=xmousse-com.20260707.gappssmtp.com header.i=@xmousse-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=UyByXd7h;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B621606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 20:27:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B621606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xmousse.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=xmousse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xmousse-com.20260707.gappssmtp.com header.i=@xmousse-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=UyByXd7h
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-49d64a88222so876395f8f.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 12:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xmousse-com.20260707.gappssmtp.com; s=20260707; t=1794947220; x=1795552020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NtQRzFm8cV5RodGkfpCY5dyh1Ht76XcmhOuef9Kv3NM=;
        b=UyByXd7hxY91bv+iLDzA2vJf9ilC73OmQHq6Bi6EZueN+8cUfFiClzaB2mKX41cX7c
         SSZXHQ+SbO5oRi4oY2j5/ldm0hqy6ZbSoicvyWVXmG/KhMf7D/ZkUOFYvBe9kXwAs7+x
         ZdFjxcS/an6+FwHKsRYrbBrm6YtAxpBYu5tXEinUYQar2FMgmnY3nLEx9S27TTSGZzDC
         5fixvuB54+4cQwhzrFDkq3nrqzgHRJ1U7GfrUiQDGIQe7goN8hN6ccyu9xDeu5Owkf5k
         /X3eK8a7rUwnrKcAKgAX0wl4hi8ukUAU0qC6hC1ntoQ5o0OqS9927kOK4Pw7JhJRO/mG
         01Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794947220; x=1795552020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NtQRzFm8cV5RodGkfpCY5dyh1Ht76XcmhOuef9Kv3NM=;
        b=ndCbAveJOEa7mnb8e8p/w6MKcqhk2ktZv4yIrO5332He4733qnxOVO0RR4q7t+C7/B
         ix6KzLiC4qHMshuaps2r9KrgBuLmQE2buj6rJcug0OLiEEISM/DNs4iaBBxgimN1qA+G
         IgDhcQEp29dNgfN3eqeG/kK6zVEjalq9XAILF55HX6zoPVbmX0CqQCyrZeJHnD88r+xk
         KnR65A1b0gzqU53wadC8icfWfmgU69B+OHinbZQwbsEA/YRAaMrDZYnCuVpLeN8dCAah
         MreFq2CtPwdI2gKfGEQCGXAXJfjM/DkMOzJbsszlfagoh/ADrX+ciPs+pYhhVCM51cEn
         ljjQ==
X-Gm-Message-State: APuU4Z9Qm+CWiszEipFgFur1O3ZLrEvri3uE5L0J4MbNm+KhnSXgjti2
	30PFqGfHeNgs++eqSQhhJDiro08/OMU3lmLd3kJgQFj+1uJ7mytj9V4yyNr4YqWvbyeBP0YBIvD
	nnS5VTNegRj/H
X-Gm-Gg: AYBFou3/TjyFRlL1CQFrgXuJieV1+3lE8QddunlOV9UF9xw0y1OWT9sDL3QSGBjPkbE
	gCQCmauZUQCVkHmwFmEMgNsUAnGwiFvXW2c1hKiaqJyPHd/yhrgdkDFoUKPc6I/DgG7DiAyUS/D
	ETTRmT4JeZrX1DfENGbKwS7LGnKzglK8dl+LIrWd9EqunMjhNXk0PIeVH/EU5n+9rEyymUbCLuj
	Pe0g0hhqs+UOojilafs6mP6kzZiqBbj5GHZScUyPOx2Pt/55ruivushl1bbU2eudw2g8ISNCsiy
	gcAhm0gKx76/nOGFtr5SzSxeiHs60SDVyrOgxFKPLMAPJ2JiqEpE5qQXDLPMgQWyrSwRePEmkRY
	J6zlre8m8Es8FETCj6J749ptiKnHy4LGHwprq8IByQeRs5NNpKlKia6f4yQhxeZoYrGHJB5WOgY
	1J/m6JehpF1pm3dsdIDWoKRTPh/hUTRWbyJCndy2ywKb0+mmsTygaOeRZwH4A8b3BYNBPaaiElv
	38x/aEMU9yEd1vKXCJE+mD33XiZYbtSSH06Yz9iR5XsPgGMscuyLu8PQQaj84/29Eijfi0KOGlz
	y5otCDxBSGs6ZmLHVjMPXg==
X-Received: by 2002:a05:600c:8717:b0:4bb:5e8c:13bc with SMTP id 5b1f17b1804b1-4bb7da17f77mr6092795e9.7.1794947220106;
        Tue, 17 Nov 2026 12:27:00 -0800 (PST)
Received: from peacock.. ([187.15.172.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7ad9430asm70271675e9.15.2026.11.17.12.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 12:26:59 -0800 (PST)
From: Ofir Mano <ofir@xmousse.com>
To: linux-bluetooth@vger.kernel.org
Cc: netdev@vger.kernel.org
Subject: [PATCH 0/1] Bluetooth: add passive-discovery quirk for Intel 9460/9560
Date: Tue, 17 Nov 2026 20:22:37 +0000
Message-ID: <20261117202632.49924-1-ofir@xmousse.com>
X-Mailer: git-send-email 2.43.0
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

Hi all,

Intel 9460/9560 (8087:0aaa) controllers stop reporting connectable BLE
advertisements after the first active-scan SCAN_REQ/SCAN_RSP exchange.  The
controller stays silent until it is reset, even though the host scan is
configured correctly.

This breaks WebAuthn hybrid (caBLE) passkeys: the phone advertises a
connectable ADV_IND carrying the FIDO service data, the first operation
succeeds, and every later operation times out until a reboot or a
driver/controller reset.  btmon on a failing attempt shows no advertising
report at all, with `Filter duplicates: Disabled` and the same scan
parameters as the successful attempt, so the loss is below the kernel.

Same machine, same controller, same firmware build: Windows receives the
caBLE advertisement reliably.  A USB HCI capture shows Windows scans
passively (PASSIVE, PUBLIC own address, 1M only, ~10-15% duty and an Intel
0xFC1E vendor command before each scan), while Linux scans actively.

We tested the fix space as module variants in the real flow:
  - stock (active, random address, deferred delivery): 1st works, 2nd fails
  - active with delivery deferral removed: fails
  - active with PUBLIC own address: fails (both attempts)
  - passive: ~1 failure in 18 consecutive operations
So neither the kernel report path nor the scanner's own address is the
cause; the latch is tied to the active-scan exchange itself.

The smallest working fix is therefore to scan passively for this
controller, and to deliver passive reports during discovery.  The latter is
needed because the existing passive filter drops reports that do not have a
pending report action or an advertisement monitor.

The patch adds HCI_QUIRK_PASSIVE_DISCOVERY and sets it for 8087:0aaa only.
**Other controllers keep active scanning**.  The trade-off on the affected
parts is that scan-response-only data (for example device names carried
only in SCAN_RSP) is not available during discovery; that matches how the
vendor stack drives the same hardware.

Testing: Pop!_OS, kernel 7.2.15, Intel 9460/9560 (8087:0aaa), firmware 169
(2024-08-13).  With the quirk, discovery runs PASSIVE with a random address
(verified in btmon) and 18 consecutive hybrid operations produced one
unexplained failure.  The patch applies to a clean tree and builds
bluetooth.ko and btusb.ko.

!!! No regression testing was performed on other controllers; 
the quirk is keyed to this USB ID, so all other devices keep active scanning.

Public reports with the same signature:
  https://bbs.archlinux.org/viewtopic.php?id=298396
    (exact 8087:0aaa; scanning works briefly after rmmod/modprobe btusb,
    then stops again - i.e. a reset clears the latch)
  https://discussion.fedoraproject.org/t/intel-bluetooth-wont-scan-ble-device-works-on-windows-blank-scan-on-linux/196326
    (Intel, kernel 7.1.3; btmon shows the extended scan but the controller
    returns no advertising reports; Windows works on the same laptop)
  https://issues.chromium.org/issues/41485480
    (caBLE passkey never completes; worked on 6.3, failed on >= 6.4 with an
    AX210; closed as "Not a Chrome issue")

Note on scope: ArchWiki reports that passive scanning is broken on Intel
AX200, so I deliberately did not widen the quirk beyond the tested USB ID.


