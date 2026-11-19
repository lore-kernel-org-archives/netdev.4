Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795123200;
	b=dLM7819PiiiWtRtvE/4ynGOGPuXeV7+6V7SZxFSbL4ZD9LNrpJdgMLk5xAye4JKfMSA1
	 oDuoFd2aYfKP8pJlyUn4/0LmE3ng6UMMKhwXpsUQKcpzF8a236wg9xJNTESe9jetFZJLU
	 C2FylLEFdQuKEV2TIhOS+nYQf6cYd4KVth6EFkVcIkBhRpi+gT7CnA+Wko7ok43EJOpHL
	 CeetBuIFr/WalnhtNRU2X5TWDX1oTAQjLtJVj8cJV75A/ffSlxZVnOxUmSF4JzW/1o7vx
	 pbTp1FTT0FyIKNRaJBH+uEG9pvjKpqO4ceafpWYL7/Vh7ANCayruW0IdqUkki24mamA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795123200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OZc3Hh1DciK5xgYmf0zZ1RClkKI7jh3AfHf4r9PdGc8=;
	b=OCRmUODIOVyJLLuqhoAbQoR/eWn6TgO5R4L7cIFb/EB3jWzzQuQaey5Dhk8It/w11iZJ
	 cJbMCy5KT4TtjolXDgLGP2SEg2AKCLwbv9J9ye7E9NPR7mkOhVYFpt95tyF8+1SBtCAgA
	 KgC2JPb74NbgVGn8H87wCYPDL8iWt4blrFmk6L9UBVN5VG/yeamF6Fw8R81HzQUd0oQB5
	 3zEaDnF9UqFpKuetSOlutQdYFl3M7vgMdg5SaQYVAkJtVTxcF2OyCqwlL17OUJMJLNsHB
	 BxPHVgeO/2GfrbmSrTYFgIh38r9Jj5cLpv4saQAPaJ5qajH0KdFmgejJF1DeWDgLuCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="iDC/YNiY";
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81680606A325
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 21:20:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81680606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iDC/YNiY
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso228322eec.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 13:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795123200; x=1795728000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OZc3Hh1DciK5xgYmf0zZ1RClkKI7jh3AfHf4r9PdGc8=;
        b=iDC/YNiYbghLmUQJ2nboQ+S+l1VknX/qKPG5qWckFR4rRYriTc8SXF3QQ9PeklkGVd
         /wlu7qK18uzPYzqjn6yTXZwuFszMzfAYhmiZcw0lRJYXxbVl1p6Buh1hb99VGY/3tIvr
         GqiiFRvyohhMonvX26kCYK2ABRYqVZSF6RtT1yg8liO6xSM1kVdl8PsOxms1+c8UahzG
         3h0IKAA6iugpmGOm+MYi6raMV11nRK1xZn7EkT8tlTGIWI4S4O4xRoX93SLrIavEV2L3
         ym8iPqLIye6J8KrrM0l7UlEh3xVk6XWSHdV0yAcN4uDjhpknoBZgoJ7Gp492tzBlI5l6
         Vs0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795123200; x=1795728000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OZc3Hh1DciK5xgYmf0zZ1RClkKI7jh3AfHf4r9PdGc8=;
        b=uoNPN4z4MJssVdzwUVF+irasqzrcyFBIr9WhjkzH+V530onKr+ps2j76W/r9eLIP5W
         M5/JSvbn6ZsLaE3xHnFi363ZAd19RiDYFT2rJsk0Tmzy7kzRfCoaH73OCrfZk1962+8w
         8Jnpihbw1JBJvMzuNCZTFhNFG3v5NFeCHUq2+s0YK1BPGalNbvbPiuJWnnjPUjDits9/
         yAQ3SZtMRg7/Tzh4kCxS+ChmqFglRea2kjEDZg+35ekhMCHU/MpQrqqdiR70kDi9Sifi
         CwhIGyubXw8dZfWTafQ2Fqzf+Tc0jOnA5kZ/h112v5r+wjVCpvmPeVjp7Hu6iY/Lg4S7
         yTdQ==
X-Gm-Message-State: APuU4Z8nKmTufda0HvAluzb798Vwu/DZSNmcwLRDx6nv6ldwoUtlzi60
	NQ5e69VyXpld33IDzEgsnSRmsqlV5BKhttfDtoyeSxPSfpFVoPQciSrGfz5ip9Ui
X-Gm-Gg: AZFdTZfsE5QG3Xx+sdsn99NhYDPoxf4Crj1ihid6GCFkDxrhcY8QThZs2x7JLoueU7I
	no+QG17EH8Trl54zcBLAPFkgn/DppOzaiQXLkktjJIccZVxJ81epvqPrXJw5McV+WXpJIKICRMA
	wW4C15tvAhIG0bKrG5StrJOfnK+PqY8Y+0foyuIbgNzMYcwiAeQI6W1T6KkWf2uUoCngm7gepJk
	UJRuJeKPfrs3FYW0/wpb3BaF9BP4Wp1sWphdpC6u+aMFhwSbS5gc5mgLx6DIjE983CGsZhYO08P
	Bc6W4dXJMXXZPfU4AxuwCU1F2oXEu6DbctumBh/Gb4EdPMFwTirX+klr1fePRdp3kgkqQEUak/g
	PYaUZAmvrbHX0PcGhLUTwLkXN9wrTCQM5zEHPMJmTKb0HIsILvM0K8lpKA1VEMo78oZCsZUHZvS
	jLh2+ZRkp+yeWwIhzwcpuyOeVJ81jqoN78mIv6IvTNkhzbSKas0Sb4a/Xw1vpaUQ9dTUyy0DTmN
	epwWVZ8ReeJOkPU0bTt28qPI/yLpNmPilwybNRB+gOGJmMyn5zD0DUt5kFEBe1ezefRZvxzuTLB
	NrztBmvt/oFUnjMS4bUND5Rhy67EBQFtWXl0KmQDKerWmAEaNSjNecyGLapZID4XdbaXcfx7tnf
	fHec7zCUYnsuHYeQ8AYJecvfcy5Gm54yHkYuDBdt4PQl/heRqELUv9cgAoh6Vgvqe43Lt1FOw
X-Received: by 2002:a05:7300:3e93:b0:36c:a390:8907 with SMTP id 5a478bee46e88-3857015eaedmr578371eec.21.1795123199544;
        Thu, 19 Nov 2026 13:19:59 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567ea2cc5sm1466388eec.29.2026.11.19.13.19.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Nov 2026 13:19:58 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org,
	richardcochran@gmail.com,
	vadim.fedorenko@linux.dev
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	pabeni@redhat.com
Subject: Re: [PATCH net 1/4] ptp: ocp: prevent timestamp rearming during detach
Date: Thu, 19 Nov 2026 13:19:57 -0800
Message-ID: <20261119-timecard-common-v2-078fe69f33-r1-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <ad6883e5-c103-4f82-8040-e5463477ca10@linux.dev>
References: <20261118-timecard-common-301f823ddd-0-ahmadexp@gmail.com> <20261118-timecard-common-301f823ddd-1-ahmadexp@gmail.com> <ad6883e5-c103-4f82-8040-e5463477ca10@linux.dev>
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

On Thu, 19 Nov 2026 at 18:24:24 +0000, Vadim Fedorenko wrote:
> On 18/11/2026 20:05, Ahmad Byagowi wrote:
>> + mutex_lock(&bp->ts_lock);
>> + if (enable && bp->ts_stopping) {
>> +         err = -ENODEV;
>> +         goto out;
>> + }
>
> ts_stopping is changed only in device detach callback, there is actually
> no need to cover whole ptp_ocp_ts_enable() with mutex, I believe
> existing spinlock can be used to serialize this access, no?

Yes, the existing bp->lock is sufficient. I have sent the four-patch
v2 common-fix series to net:
https://lore.kernel.org/r/20261119-timecard-common-v2-078fe69f33-0-ahmadexp@gmail.com

The revised timestamp fix uses spin_lock_irqsave() for the stopping
check, PPS subscription updates and MMIO. Detach sets ts_stopping under the same lock. Keeping
the register writes in that critical section prevents an enable which
passed the check from writing after detach has disabled the channel.

The disable path still flushes the interrupt-mask write, but drops the
spinlock and restores IRQ flags before both pci_irq_vector() and
synchronize_irq(). The former takes the MSI descriptor mutex on this
kernel; the latter may sleep. There is no new driver mutex or associated
initialization/destruction.

One additional detail is the PPS no-state-change shortcut. Once the
IRQ wait is outside the lock, another disable can clear pps_req_map and
unlock before draining its IRQ. While stopping, the candidate bypasses
that shortcut so detach still disables and drains the channel itself.
Outside teardown, removing one of the PPS/EXTTS subscriptions still
leaves the other subscription armed without unnecessary MMIO.

The source-derived ASan/UBSan harness passes late-enable, in-flight-enable,
active-IRQ and in-flight-disable cases, shared PPS/EXTTS handling, and all
six channels. It asserts that MMIO is locked and vector lookup and IRQ
waits are unlocked; six deliberately broken variants are rejected.
Both common and WiWi integration PTP objects compile for x86-64 with W=1
and KCFLAGS=-Werror.
This is software evidence, not kernel lockdep or physical unbind testing.

Thanks for the suggestion.

Ahmad
