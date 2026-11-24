Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795527288;
	b=xZHBodcazLs+SAMzUPHrwySN6YLByDBm5UGoE2r+0WpVjQFPhtZGR1ytQd8tWxPdd3iX
	 zqdNErHhIWqE8FspKtnNRYjpdsVkGHeq+7Qy6AXTj0eS4r7dyTeh1Q8z0r9mNvNjosWyE
	 A0lhmCBkFTeSLPM9xNrUOyx5frnkkc6cG0C/b4I99f/+i1GMRGax7KUZla+8rhxIO7ADd
	 C0ZSnOrh6j8MyDHNKkq+FKIMBrs2MD0uSnlNj5tBgkmKBzb56oeuGpd3+sDqqKalzzlzj
	 5PT/wONQnfFjNB/vpV94gCHBKBv9jwFC1HH+1LetTeB2GXvC9BnK+jDrKJ07eEU66+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795527288;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=HJW8lCu0LwjPi/yznQ1wwCg3MbHuP8qP0Yz0AXfMEvE=;
	b=rFuA0a5qU26wfDAW/TI+Gtm3mycjIy1TMEkG3+ZytbE4FSP3WE7AVZLg4AN9d1L1FZeL
	 q4No9TxtRah7a3jX9kX4hxe96i9ynsfFKAZhmLMtF9ZvVo3mtdGMoidkC82M6cdsvopQl
	 /8qVCtgqk9VQrqKfcNgBuZHBDWVv9mKaXkm1i6N2n/O7bjN1si7dTR4xC1I9yeptr0kHy
	 SHiLP6QwPrh/0+Ovz1Yj2Z/q5c5/lWixiXf9sGV78nbcOM2LAW9Tr2txWnYwnUThc/S/m
	 g7bhBQ8f50WliQrTVoK9mi/M4ikWPN0pPKmvSgeiLujZDfDA0h3ctY0mBL7LjvDJ7Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YD3R5opB;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEDB606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 13:34:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEEDB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YD3R5opB
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-385d8a00598so6503610eec.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 05:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795527287; x=1796132087; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HJW8lCu0LwjPi/yznQ1wwCg3MbHuP8qP0Yz0AXfMEvE=;
        b=YD3R5opBT1lfX98nfjXVonYPqAjoJ1aGohJMHLTBFpcr4UHbONARRICEYVLGlOo8Cv
         G1LgOO/JBYMngyBCB1cPDz5seotwizoXNIcEFMnlGBVxXKUi4lNM+IQdZChID5m/DnYu
         MXnPZauNzrYJp9ppjc7xuvLZLOf7dOTZKvYzBwNR8osRxRQIDpsM1YxwYcmPFBWDRQt4
         DvRQ39IgNtAETWQW8v0h/GswGOkf02lijPSIIWpw8zp4i+m0lpqp2DO8DeYWpMTeT6d+
         tNyLGRLHYPYHSorTbDrUt++XuHBFvbHrnNMjUXybA15x0Ry9z/sDzhjK1WLmxE/JKq1n
         uJfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795527287; x=1796132087;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HJW8lCu0LwjPi/yznQ1wwCg3MbHuP8qP0Yz0AXfMEvE=;
        b=gOBjC66U/1QDibuXmW0zyA9FIeUSNWLBfDMYcc4UHeki0+b9dMwYCnIFxQsgJUWq8d
         yhoqmZNFVhUaGsqS8h0BxJr1rw7dDn53p73nNhSh6Pj5vDtLBG2ScLLgh3iLpK3NL/mH
         BPIQT5DD3X2o6X8eINQywTz8hrdLzdfrajYXbYrdN+4VBC+YmNQnhETSFAMfeSS4JkVb
         7gB+3i4N4LWNlBKwjmqEnBtv4sttKmtb5svdlV9UqdmBkVOMwpGkLPbYVGbZMAt3D/D7
         xK2m2yEUx6PhvmCzqQR2zraKvqF4mrb4pFWwWpjYguXlvbEREqXU0gcAsuBOvvrtmYqK
         5PhQ==
X-Forwarded-Encrypted: i=1; AL+hErHSc8WUmaoxBNJgxyV7mNOggJVHn+cNs4YSfsqfU7zlYXP14YeSm2qdJlyN26oOJoB0Wmu6Zug=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OWr6/6DSYHFvoX/7ttWKPpxcBWOH3tSMyXcHtTDTdHO07UHpw
	KD11CCbErzhAYNHJG3Iols9Rh5l32dz04q26U3AdXsHcUzU0kcaiwmyc
X-Gm-Gg: AZFdTZfOWoHk+BpHBtvyHcb1cgGU3g+O5i+9DJjqNI5xSPaUZFLFSqAFrnnccVYTlGf
	sJIwFHzJSIGgD3dioQwaztXLkbTm71LEGhvGM8xp+K10ACe/va54k8LTJ/oUhFQQzfeP9ehoYJy
	lHY0oqeQOaBt4qntRTgx7gQS5wvgZ7aSQpHkMGq6G7sb7b7hv6mJW/ChAsWwzdJONZFNiWpg+W7
	EgJm6a+t75cP+z4IGNh/XMyH9bXXozTXYpAXIWYMO66ZbxXZt6ehKwevdyjhTZBqpxS0AgMhk1T
	SGMNBFgU9qZwP0BtISRCc9PGhctfrSdwc8+unG3wpSuMs3b8kaBdlk0gKdZSyylFx4jTwfLb6Zb
	G5thAyDk0adqgJIL+7gumu5PkcevHhgPNUIu+kDND9aMCPPJB6NH8YRu8zj1N/97wZqc50O0Lml
	dnc2JRat6ITFYYLyxC/0fGNTQMimhXCeqMKDiq8wetpB07Uk0ecWjOVCTGsXUtZ3n/MVpBLoL3J
	X7n6RBOTEC9PTeixrYppYBKr2jZt98+0Z21NU/DWEzMDA3a+gI4WDdAwZWqfwS4Jn/W8akjKKWa
	hf4t8Pcb7NtKyBysgYxgRIOq8JPj5OUrch3dDA==
X-Received: by 2002:a05:693c:8641:20b0:383:50b7:1d78 with SMTP id 5a478bee46e88-38571223ee7mr16750852eec.40.1795527286504;
        Tue, 24 Nov 2026 05:34:46 -0800 (PST)
Received: from [192.168.29.85] ([2405:201:8026:213e:1412:77ad:61f2:79f2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm54267035eec.10.2026.11.24.05.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:34:46 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] rtnetlink: fix NULL pointer dereference in
 rtnl_get_link()
From: mdshahid03@gmail.com
To: Paolo Abeni <pabeni@redhat.com>
Cc: mdshahid03@gmail.com, Jakub Kicinski <kuba@kernel.org>, 
 davem@davemloft.net, edumazet@kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <41103c9d-5c08-495a-b5b1-66fc15e2517e@redhat.com>
References: <20261120134548.214126-1-mdshahid03@gmail.com>
 <20261120100415.363fcb19@kernel.org>
 <179525944307.361783.17801110279499293110.b4-reply@b4>
 <250c2bb2-57d7-4f91-a32c-8f6ac7d55a46@redhat.com>
 <179544969959.175192.4403952228876691788.b4-reply@b4>
 <41103c9d-5c08-495a-b5b1-66fc15e2517e@redhat.com>
Date: Tue, 24 Nov 2026 19:04:12 +0530
Message-Id: <179552725231.187861.14163919455346118294.b4-reply@b4>
X-Mailer: b4 0.16.0

Thanks Eric and Paolo for the detailed explanation.

On 2026-11-24 09:56 +0100, Paolo Abeni wrote:
> On 11/23/26 17:01, mdshahid03@gmail.com wrote:
> > I think,I may have misunderstood this part from NET documentation guidelines:
> > 
> > "The commit message must disclose whether reproducing the issue required
> > modifying the kernel (e.g. inserting a delay to widen a race, or[[**writing
> > a loadable module to issue the right sequence of calls)**]] or using error injection."
> > 
> > I interpreted this as allowing a out-of-tree test module to produce
> > an issue,provided that it uses legitimate kernel APIs.
> 
> Please do not top post.
> 
> The problematic point is the 'legitimate API'. Adding a delay under
> a lock is legitimate, de-registring core functionalities is not.
>
> If you want to use a kernel module to demonstrate an 'issue', such module
> must do exclusively things the kernel is already doing, it should just
> enforces specific timing/sequence that must be already possible in vanilla.
> 
> And if the race is possible only with such a module, at very best the
> issue will get low priority.
> 
> /P
> 
> 
> 


