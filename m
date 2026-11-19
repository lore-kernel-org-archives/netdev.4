Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795116763;
	b=b+UAqOGP7fL1UhrGangF7zYvNWVHvaUzSz+Qq1QSg13d4Ysw4C1b91+r1Fj9WNndJnWu
	 18Ej/dt8E/K1GdCp9OYNxRPkifY6wXuBc5ggPDutOQq/sV7ABv6E/uc80y+rstMngwcYu
	 4l/dOFbgrzknjFRxox+8m1bdlzELLs3ts319SAjbAsh1gcDzUItbOOrljDS8wiGZimF5u
	 GLL2ZYiUjXaUIzYVdhVKaqpB5ERUctPwmf0oeawSEavDqHfn+tP/L1uUfv2WBZb3orM7I
	 c1MvAGZFa7ysLBqTvwZC2vm8UMk4mO2Pm6he0eRUH9UeT4IGwdT34TSEfzTbsd8/V6A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795116763;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=2c/CMF807UVrQ1AK631l/bk5YzH/qPyRcaggbCxLlzY=;
	b=S0dfFhcCqv1jXS5lAgLQX3B8u3k4RU1LsVVEaAG4AV/QLxhQp+uGwcDriFcnUjj4iqSI
	 wca7y+hEM1DHyfkSfg9KjUVPsNz+L1fBgQDraZ80LkdoUB0GbXFgYwsC4hcBOerofhKz9
	 LDrD03XubeQlNMSytyxnG4GWI2nQ4SToirS7N1zdLjIQ+7SRE9GX3gPyA5BmHEtLXJuv+
	 5RCD0e33tauhksSRQlZxMmVbNnd0Q8weVb5iAO72A3seKAueH0xwvtFB6GnVOHls57vXm
	 JyFE03ujj8uRaeLF3ar0Pd6kKYsx/aBEdKwv06wHWPq7pMGzASLCrCTiObQERCt97sw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LRH4bQHu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B880606A326
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 19:32:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B880606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LRH4bQHu
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5c14f3dab0cso17072e87.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 11:32:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795116761; cv=none;
        d=google.com; s=arc-20260327;
        b=Q21/arzHExuehiinDPSa0Or5xlAALEualeMVY1wJbPx89SfnD3646BRDVNUUR1BGjw
         L9sAg5o8wrqCsebZ3ZrG6DoLGWXN8rVt0p+xDLX2szeZ9pb9AZKHWH7r4/5SL/XfQkjj
         CNOU1aNLtRcQBUuILmqb98fxOci3OFAuSzCHmxXPg27SNMhozOmTjq9qCg+ednmZbzd5
         lSJeqpih22fnvZF10mvwLibiMe81nh+izKizwcSxkVOLHDbENkrRsJ64dnSumEnBrLB5
         WF4BnTrk6NMspkFhL+iPwbTkdf9jhBob06CQ16WO4UOfR5QgCI/QMtC9Bl1HE1uyXAgv
         tHWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=2c/CMF807UVrQ1AK631l/bk5YzH/qPyRcaggbCxLlzY=;
        fh=6WR8VOuA6KmxnF1FUPOhtCQkFWdz2U66bdT8uJ1YRnI=;
        b=lEEP2PoZJUUudslnKoVyRxf2FyYJmR/PULiIH3mUU0F9b31h+MINOlLMb1nPGpu6Ed
         1IkubwJMh3iIMKSimmHe5Ng850z97GmF5QG5iw1qkYr3azabTXh+Pf9DZfjrdh2H8dZB
         bUiimZHErqatz0payoy/7128DLiTMXY9cBooIBUnnNCoxcXvc8UABMN4Hrqn1KvwambE
         UbfNEESRk8rtvn3dKIlte6VseU9Qr7pXNZhufaquJ/mPt0ZPKQASS5nqRMnXDcoWborU
         PNI9UbRxjgt2YRGkj5yP/1DjZRJ/6biYuy2ZKHy5hgabWxiIz+Ie7yTJVRKgAbNLngJL
         9f+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795116761; x=1795721561; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2c/CMF807UVrQ1AK631l/bk5YzH/qPyRcaggbCxLlzY=;
        b=LRH4bQHuzh/UJhOZ0Uil67+DPLIEdZAzc8rkXVE7GE6Tn73uVT+7q3/rRfpIjb78Mv
         8HSPE39wlR0/qJKwYKN9aSwy1bQmujSafA0Qee/gAZrM2Ls9UH8stos4+Dy16DcmX74Z
         fe+cmZd+8hivJwgwPg55ZXJ3kts28t8jzQegBUZPYQaEIRC2Og35ZFzOMojQ5CsujOwt
         GTTJ6CTISP3T24tSWu8DAGEZi7dRJkcVy3DIVqSGiXK8WvjxE+Q8I4pY453L/e5DZ6RI
         8/rYTJ5uSgaz90SzO3gT+w+wkY6rMMaRMgAdlg/ClOq2DYuxYBUikCtZN9eaBABn9wPE
         HjPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795116761; x=1795721561;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2c/CMF807UVrQ1AK631l/bk5YzH/qPyRcaggbCxLlzY=;
        b=Li/lfTpr6blcOiJ+CbZAU5Ca61mBMLPDCSC9ejVMcXCo+lYTU7fA4AyJO0CoXHt+Sm
         S5Kkjv8Y4kAT/S1vTwIdMJMnN/NE7l7pdrtWLjxxFLu4HBs5MKVxj9AV3crZyoMl/kiW
         rjKzG0es/5Agjg9l9NjLM9tl2+R9XHDHViuS8+3Ta1xj0RwCvLqGM9lUez5Fy0EdPADi
         po6IVj1t8gKfV+FdWuPbuC4xqNKPMPVA/o1y0V6SWPXBCRhtuCWOWT1IwJwinERX4q2w
         tqyx+37vnrOZDwjX0LXZz9bfhbuKsH4+hF0J+mKv4butbg34UwtP9QxIEHtk7QlPxgSm
         0Htg==
X-Forwarded-Encrypted: i=1; AL+hErGClW63BITwoG+nF+9hmzWC8+0S0J44yxHR7NiApj20JyMzXzc1OAGmTreUlPh3Yjus73Vjuuk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Jzz9IMjycuRbQN1Un/9JarqCayBUyqoJc59kZo/1UIGKh+gL5
	Hmd3wA2l4r3cppoQviQ1xrPzMQsCqk6i6mg8NR7PZKvYbJg8g7+/9gHaGt8d9k88HZFwmCh58xP
	oJ3BHXnxZUC1EacyEfXeEiFM3vE17Ce0=
X-Gm-Gg: AYBFou0lHrUrQ8j5PkB1r+YvSLSllOXAhh3I2nNB2q8/mO283PdLTmDrdp0BOMiHmU/
	qQIJhIly3MpjzFkT/w56uwSXtRw8pCL96Ml8bW6IBT4ku75P2NeVo+rjVlpKmg8uuwXZpGjwYvy
	0H89GnUotMkVak34Jxy6L2Aaoa7tLFjbuCJ6pzzYLg0YxArhS6XY6YbuwuHaytf8WXPP/ScgN4x
	RdldA5Y0QnDGMQRhf1NZXgCUTG6YUiSzNnhwuA0enCO6iYnc43l39jJbIc0shqX8lA2bcrQOUw7
	irvumJlRtond7j1AH/fSBqXe8hSYexQpyRUCTuzI9V0rsCohufiEG8t9xdcbeT0Dbdsym7FsCOk
	ov1pXnxu0gz7jfThzEvd2YNwWXzkJmVMDdLxz5SHHwDNtddscZWLxiOc37IvZ/Tgpgh9tHxXBJM
	I3O2ZGm7GLmZfMV8tpxpc=
X-Received: by 2002:a05:6512:3b21:b0:5c1:4c4b:6b2d with SMTP id
 2adb3069b0e04-5c1bc8f0665mr180691e87.58.1795116761108; Thu, 19 Nov 2026
 11:32:41 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Ahmad Byagowi <ahmadexp@gmail.com>
Date: Thu, 19 Nov 2026 11:32:29 -0800
X-Gm-Features: Aa3M54oofjjNnNH9tTc-QtW1TB2fkTZKj5AQD815z4ZiiX_4dzQU-6GhVDld0gY
Message-ID: <CAOQiBWOrLLR_hDAxGQeDT0ogrR0zDDvo4vrk6_viqurAHh33uQ@mail.gmail.com>
Subject: [RFC] igc: TimeHAT I226 PPS input filtering and output mode
To: intel-wired-lan@lists.osuosl.org
Cc: Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org, 
	"anthony.l.nguyen@intel.com" <anthony.l.nguyen@intel.com>, 
	"przemyslaw.kitszel@intel.com" <przemyslaw.kitszel@intel.com>
Content-Type: text/plain; charset="UTF-8"

Hello,

I would like to upstream a proper solution for the PPS behavior addressed by
the TimeHAT igc driver modifications:

https://github.com/Time-Appliances-Project/TimeHAT

There are two independent changes in those packages.

The EXTTS change accepts single-edge requests and filters events using the
current SDP level in the interrupt handler. The recent packages wait 20 us
before reading the level, with configurable delay and inversion. They also
force every enabled request to rising-only, including both-edge requests.
That behavior needs to be corrected before it could be proposed upstream.

An independent user reported improvement with the patched input path here:
https://github.com/geerlingguy/time-pi/issues/28

This is a user report, not a controlled current-mainline validation. LinuxPTP's
both-edge mode with the correct physical pulse width should be included in
the baseline. Sampling GPIO after an interrupt also cannot reliably identify
the timestamped edge if another transition has already occurred.

Is there a documented I225/I226 edge selector, latched edge indication, or
supported workaround that would allow reliable single-edge EXTTS while
preserving both-edge behavior? If there is no such mechanism, I would like
to establish the supported approach for this hardware with LinuxPTP.

The independent PEROUT change removes the 500000000 ns half-period from the
frequency-mode condition, so a one-second output uses the target-time path.
The project README reports that this resolves its PPS output behavior.

However, both the packaged driver and current upstream already contain
5e91c72e560c ("igc: Fix PPS delta between two synchronized end-points") and
84a192e46106 ("igc: Handle PPS start time programming for past time values").
The current source also programs a future target time in frequency mode.
I do not yet have a controlled comparison isolating a residual output failure
despite these fixes, or an erratum establishing the need to switch modes.

The proposed comparison is stock current igc against the same source with
only the one-line mode change. It will measure phase against an independent
reference, pulse width and polarity, and behavior under PHC adjustments,
CPU/network load, and repeated enable/disable on both channels.

Are there known I226 revisions or operating conditions where frequency-mode
1PPS remains incorrect with ST0/ST1 set? Would a target-time workaround be
appropriate if that comparison reproduces the failure?

The goal is small, independently justified changes against the Intel trees,
with the correct API semantics and hardware evidence. The packaged driver
should not be merged wholesale.

Thank you,
Ahmad Byagowi
