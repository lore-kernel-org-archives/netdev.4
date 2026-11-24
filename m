Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795505341;
	b=VQgvGaCROoFJ9fLUgkwS1Df9/aCJLOVOBnoLxN7xlnEEvwGke624dkWNHF30c+WMWXRX
	 Up+0Y/ItWr4HTOi9VC5UnTZK/AcD3HDWAxLQ4pQP1YFPluRReirJSY4G+jfaKk4WQESyS
	 FgHU2LnLrZAjCy/sXUdS5zaz3TKV0YmiHujcy2k6MzkvYCdwj+MwOjEsxZOaZO9hQpeXk
	 /h5OtpIn7wBHQmAnW/RIHns2AcvryPhF0MyGEZvpS21xKhidq9cdl4CXDaG9xVPTnC6LL
	 93clsiR12xLpO1mt3xqyw+FtnDEy3VV+cTJv00+Ic7PBsIpI3JIiWh5ue0KOwY4J97A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795505341;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=Yqn1FO4I0DjxyEV4hfY+IrP9ze/3wMUKhm1cvsmGmxg=;
	b=yAynDRJcL8pK9FjauIRM0uvPPbRGtIoA5U2KKPwbZMFlRP81B7gefy3JMMFkSs7Rkd9y
	 Vq/07WEw6CDR1ljW+O1ULkxScpzoJJ0Xrv1/Kf0HYHKJDN82/Dd7e5f/EvXP2hZdR8RWc
	 VaXeSt2Q/Q1sT5gZji7fpiza3BcqpyrkF75HsEgolv9dIhYt48NI3MnWcjKtNeyOIObNX
	 uw8OSsfOlCUlQLEHWqfpD3pibPcqa08grMgg1osT5cHM7tQuG5mgrC0gb8DVshGIUXMPy
	 ETmyyZ+TsrZvMIBhDEcJ07pZysbt8olYZSSkH29fZxYiGHkWR1QWOS0nX7IGDWsDRNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eVmdPbDV;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3CA606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 07:29:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C3CA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eVmdPbDV
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cd61cef87f1so1757124a12.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 23:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795505340; x=1796110140; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yqn1FO4I0DjxyEV4hfY+IrP9ze/3wMUKhm1cvsmGmxg=;
        b=eVmdPbDVmfH1o8pWxxbI3Vmh0fdBbigCHIOHo5tel2MDsgA4aVqTNhiKU8AQr6+thk
         W0WTPLnD/2fPw8zo5Zqsbnj5PkgWpIdOdZEgKC2CBgV6uYuMDOWL+f80RgByu2unl9/q
         XR0L+SI2U8yL1e1Gn36qtKvwe1eRYbX9bygrL+iVoDv34xXhbkgc1R/wrF5DPdjo2gWI
         At1mDGofxLwNuJ9EQoBwQkb/61yoi01hbT++HufcG6J2xD/UUFRv/x2PF/ZkHq40LHh+
         LF+6ofMTJk5MHwa4t7sYLO3Y0I0QXSI2xQaE0HjssG3YUOY/TwvIgHtd3wztjOZrCBZq
         F6sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795505340; x=1796110140;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yqn1FO4I0DjxyEV4hfY+IrP9ze/3wMUKhm1cvsmGmxg=;
        b=dYJ9clRmGu/TLiprbV0JYENs/ToQZvbm/z6kRlCBY7jUAm7ArE1i5Cn1mxvFgVuJ3t
         ZWMvDSYndwfyB4t3r5L/jsaAhBpx8vq748js9ZRLrK8SkxQCds3VOMcoDzv2CpuItKnb
         egk9UQqXOo+9Kb+XMxQMcxdT1ax826nLjOwwM7S3b2x5tTQCUj/zYEwp89i9aV6iSt5q
         LtuR4/dCHwA2Pfww1VKgrUwt18xXoyzbMeFHUAx2GURTVOMpkR+LhgnHrCUWew47swLZ
         96rjqcxJ+KZfvXaC1HPwrkGUlDOmK5w4K3bK306PCqSrnFLCKMEJJFhoMkH4tbnICFRW
         ljVQ==
X-Forwarded-Encrypted: i=1; AL+hErHOdnK7M88DmhiknsUgI9n0hcTfAOe+GPz0J7XS7TswU6GlzYdZE4SYeWgvjxEd5EKkJuXvGVQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/A6jIQ40NWd7o+ktJ4Id8vvTgmVf/MPXdeVTxX23brO0j1hYdK
	vWFYvAAuz1oT0U5tMf+fyFyS2ljq5gnR0wM/CHihNLdARphHLjrHMUt5
X-Gm-Gg: AZFdTZdJL4OsaowaVCVfPZCXeeCGqZ4eq+YwaLCYbcke6KaFr3rEX+xKzzvZzQGkmvd
	4D2WtzzUmNtCNIJMaujuhouhD0fBQ/KsPA6zBA6IsiPEYFb3B+M5wlpBPBUz0KbgB5w6HvmdAXW
	LtqJ2iIO6DCZgovJp7Vtms8yTFCODdUewR4Y2vdJ0KJf8R0l5qV3N+zxAZ/0sK4fyofF5SEiQmk
	96DIvNbV1RQU4YXo6BdkUqwG1UnPDyu/ph/Vf1Gu38uFM+qY45/MBeXoSMxHHPmHhp5rVrRipYN
	JdtgnO8XvXKlHMj4XBADm8UXSkKlSUH1rNQiX6UxRZQk1HO5tCJ7aow6msfGxeEcGDy8mcxbIUA
	isP0npulU2LBzqxJtngtvZuKo0yRScElGQyPoN6Sre3MFRpSFwuUmzXpe0YDl5kyiZEGyzsuSzP
	uoY0jUg9GVrKyo5QfkFEgpkF9adbtFK3qWXvbJhrQF3DsEaoDNWqA2BFAMqna+FFJctcvWwJBO5
	9eaLSNexWf9qERlyve5C6S/MPpFUnAhT/9kgUshv8HHeMX1EWcJHHfVT5U1qqJq2hMBHZ0F9iki
	5t7ZBRPCJ8Ge38vwHHQndy3jBu2CRNtGnDIb6xlF6YR/muQAudAeiRiHsnK3LoYTpMvRtoqWTRC
	Cubu/+E6DsoBoBTUum3g0jxuUrMa1SmXB5F6h
X-Received: by 2002:a05:6a21:4383:b0:400:6860:e8a with SMTP id adf61e73a8af0-4014d35f22cmr12901584637.46.1795505339693;
        Mon, 23 Nov 2026 23:28:59 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([43.224.245.233])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c228sm6643068b3a.10.2026.11.23.23.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:28:59 -0800 (PST)
From: Qican Ma <goonsomeway@gmail.com>
To: dust.li@linux.alibaba.com, alibuda@linux.alibaba.com,
 sidraya@linux.ibm.com, mjambigi@linux.ibm.com
Cc: tonylu@linux.alibaba.com, guwen@linux.alibaba.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 linux-rdma@vger.kernel.org, linux-s390@vger.kernel.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH net] net/smc: validate peer CDC cursors against buffer
 bounds and window
Date: Tue, 24 Nov 2026 15:28:53 +0800
Message-ID: <179550533320.20886.15449362529729238604@gmail.com>
In-Reply-To: <awUPgw3EGv7ATYRS@linux.alibaba.com>
References:
 <CA+OT+ON4Lt9mLvWPK8rUaHKZ01_p0fGCiCsWHwXWzT1sGaTtLA@mail.gmail.com>
 <awUPgw3EGv7ATYRS@linux.alibaba.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Dust,

Thank you for the pointer and the testing tip!

I checked Bryam Vargas's v9 series (specifically patches 1/6, 2/6 and
3/6) and confirmed that it covers the same cursor and accumulator bound
issues completely. Please disregard this patch as superseded by his
series.

Best regards,
Qican Ma
