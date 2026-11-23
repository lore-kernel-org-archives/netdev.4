Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795399076;
	b=1S/UUvzeLZQbUNGdInqIDZVP/LdNSvui4eBJ84aaO0Bt4Vf5TQXvkwsZCBQs4E9Cu2xC
	 33uot+xyUqSZZVO49Zx6dQ+hUWDCJETnblaA1q5JZMrKYX7rlSXAJOff7icgWQsTlxxzf
	 b3U/Ff1Req9HrvH0w2I+kHQEPb5k8yeqoKjLMgIbki9HBPtFrKGPB8osvELViO1/i3NKZ
	 FS/pMB92uJW0Q6NkznEKqpeHTXyd1EPOPfdrx9gZOjzC6IsoA+KMpPo0GXjQxtRT42m3n
	 jMtXt8lJQkVz122cdfFf3NK5nTwqLDKgjbN264FdKOBjI/TqB0o+cQRao7+W2WB+HFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795399076;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gBPiLOtNZeBXo1sS6gvc5aCt3HRWWKLxlMmOVRtMx0A=;
	b=d0qShn8IRz1FYTsaaxEJHdgWrxzmsDvqKz9g6y4DU+e3z87F+vmFsyRkiHB0MOK/240N
	 xY0WkCfmz3T1ANtnrgsGNQLTefmr2s9PCPHo2F6R3rbSPw9H7inH9d9JrLs5lENergOGg
	 j1UdF432z5tNLPHxHXm5yFCl9q4NZvYbU1sBaoHrH4czRM4D+MZvkoSF1NhdRt949RgGj
	 MJAnqKmApbdiQlPwJuGexN/7RNslG8HpFI6WSb0zhGYSF09aiFitbeo/RTQ08SMRolPpt
	 iC8ngxVOm11g64PQa10mTixfBzOq3WkvBp87sq9RghR3GG0VYbduUI3tlPmNKz0xt8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="qlJ3D3S/";
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21AA606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 01:57:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F21AA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qlJ3D3S/
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1a2761c69fbso1076374c88.0
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 17:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795399075; x=1796003875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gBPiLOtNZeBXo1sS6gvc5aCt3HRWWKLxlMmOVRtMx0A=;
        b=qlJ3D3S/4NRA83UA+Qxx0MV84j0g+9vascEwywrwZ98lePSCrV09t7h4sog4sC7bKz
         ZR22Hb9QGGsrTxQ26CiJnZJHkZpZ8vaj40X5pV6/dx78VhOXSE+0d8LDHial+3Lb5Dbz
         nUV7WjZLT1kfjkBqETuVhbyMPMTjP/XmYy9ywTQPA79Mm8E5n1KxvadHpZMqjUGRGx85
         D9C4iUk9OkbzSzr5299YalI0JobHRWE9IzgERW67oZJBKsSQjOxD8ZjK1B6i+NXiDqHL
         Fzxr103j+hQ4lpHo7tJhm2s8ZmgtinatIQWSzRDKLlga26a1BhENDUz6JIuKq5rNEoKy
         I/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795399075; x=1796003875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gBPiLOtNZeBXo1sS6gvc5aCt3HRWWKLxlMmOVRtMx0A=;
        b=aJyhjDpy4fiLllufjqlyRLABCNdsNf5V5/JnJfmnEbL6axZged2+a/KCf2cmIUlbWa
         27HYFOu7ius6m75PH4N+y1r2VFac4S8QOlRmGR1zWQ4P2slKJoEli5X28z44tH37d9M7
         nA0xcNS3G328fAdMbo7uJiF3Y0GaTzt9XawgWV15+7oOENYxbccZmLE9TX9lSVuBSYEj
         82oK583T7Fey8SoGLCjX/VsMK3z8W3yjYFlKBqpUs9WvhtYV6FL9aTWoFJoiLnqD6drB
         lfWCwfDUPpxF0XnaeEDgtlflkUY4pvN9ejElfWm+nyyaNe4IOTHf+ehMjX13LzP6/EWK
         wsjw==
X-Gm-Message-State: APuU4Z+AZX8A1p/bHp55DAjwtDLUtSalqEAAz4MQn3sxRN9g4LX0TtF6
	LFII7unD46QnzjlCSGI3d+kX6Kd379lsMTdj0Vc3tzSZxvINomgegcakfbiZCAru
X-Gm-Gg: AZFdTZcMfna6v0z6gdZkKIYDy4gETjkRzFGz0C1O4o9nKh3SWeSaRDY7JIZESa1l8HI
	HYZvL948trhgqi2y1D0IproCDV04BZ7QGssdWOI/fXdmInjjH6gAQwoT8rZtWmrOMQlf/3XBqvO
	FwENY7LqPUNxHjAYBnBc1bkmbxAsFa1fDuy9xRAkKjF+AOvtw/EJ1XFqW1WQUIIjyelg6ZWlzoa
	UhXHz29AyBvFVpkVdmSPQJZxv/1WGPHkpxtM7cvgCqsUcYDgV7pWzt7OKPsGuZXfzEFK63BUv+x
	FsQixYA1qjB6j/chREVpF6GPb+w+5mQiqFiXfC2UVPQvlO/8tmDZ1j3DznSUsQr5uCkoTYh3Az+
	rGQMJE+VWHrRekGLVNnd5f2aiW3e/yGcPhbQJzLowJBqirFjwHqCPQjY3MtwmYru1ghkpx8F6pu
	03E+APhtLnaXZsTZMlnX73o9xTZNpDMGsO1lAinzvvKUT+2f5eeBFVfSz/Mc7ENQGQH4T+527ph
	wqBRNELihDJyBJKrSFaC1TPxhNN47fUmPqc5+RSARXsArCno+FBtEtZxYfYZW4HuHTwVFO7RZO4
	LcfV6v2KU6CqUdyjgXjV+yjepb0axe/rd/PtA6mDcYb4Lu1qsRHMdSPRz+sNnot4W4dafVdwt+g
	lkbfbHq3CX29VNyG9Vg+h4VsDvD4DLpe2yiNNKR1fPJ3oCcB+kSToeTi3kCnvSZIr94Gu3RBC
X-Received: by 2002:a05:7022:3f0d:b0:1b5:3aca:8116 with SMTP id a92af1059eb24-1b55690bcfemr10183202c88.33.1795399074946;
        Sun, 22 Nov 2026 17:57:54 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm23923285c88.1.2026.11.22.17.57.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 17:57:54 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>
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
	vladimir.oltean@nxp.com
Subject: Re: [PATCH net v3 1/4] ptp: disable all timestamp channels after removing the user interfaces
Date: Sun, 22 Nov 2026 17:57:52 -0800
Message-ID: <20261122-timecard-common-v4-e0db4ab1aa-r1-ahmadexp@gmail.com>
In-Reply-To: <08537eb6-3f85-4a46-b3be-46796998eda4@linux.dev>
References: <20261120-timecard-common-v3-33316bf475-0-ahmadexp@gmail.com> <20261120-timecard-common-v3-33316bf475-1-ahmadexp@gmail.com> <08537eb6-3f85-4a46-b3be-46796998eda4@linux.dev>
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

On Sun, 22 Nov 2026 at 20:10:55 +0000, Vadim Fedorenko wrote:
> > +	/* EXTTS requests do not require a pin assignment. */
> > +	for (i = 0; i < info->n_ext_ts; i++)
> > +		ptp_disable_pinfunc(info, PTP_PF_EXTTS, i);
> I thought we have agreed that time stampers and pins are different beasties.
> Still you provide time stamper index to pin function...

You're right. We agreed to keep timestamp channels separate from pin
configuration, and v3 still blurred that distinction by using the pin
helper. Sorry for not carrying that through consistently.

In the v4 revision, the loop issues a timestamp-channel disable
request directly:

	for (i = 0; i < info->n_ext_ts; i++) {
		struct ptp_clock_request req = {
			.type = PTP_CLK_REQ_EXTTS,
			.extts.index = i,
		};

		info->enable(info, &req, 0);
	}

ptp_disable_pinfunc() is unchanged and stays in the pin-configuration
path. Teardown neither reads nor changes pin assignments. It disables
every advertised timestamp channel, including unassigned channels and
clocks with no pins, then disables the PPS subscription. It retains the
existing core ordering after the user interfaces have been removed and
active operations drained, with no new driver stopping flag or lock.
The shared-PPS final disable still masks, flushes and drains the IRQ.

I reran the source-derived removal/shared-PPS suite 100 times, covering
six channels, zero/unassigned pins, absent channels, late and in-flight
requests, both subscription orders and active IRQ draining. The five
core registration/unregistration KUnit cases also pass in QEMU with
KASAN and lockdep. These are software tests, not a new physical-card run.

Thank you for insisting on the distinction. The revised code now makes
it explicit rather than relying on a pin-named helper for channel work.

The five-patch v4 series is posted separately to net:
https://lore.kernel.org/r/20261122-timecard-common-v4-e0db4ab1aa-0-ahmadexp@gmail.com

Ahmad
