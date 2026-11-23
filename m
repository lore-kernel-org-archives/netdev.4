Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795431260;
	b=dQO6BqmssR8IiiuVITgYgLnrcIhaZl2y/T1cNDDlIzpP63El1XbkzGUEL5V9I3F+BFiL
	 f7IYe95r+7VVeL8NLZAc116mvrt5IqEbNfjjU/Zkz91nRmJpFRED8ts/QlMtBwGQS0/XA
	 6CRZ4wg4yRdTN5b8sWeW2D/xnF9ih0kSeUJVF9A8IEAgJcwxEKTXs2ameufBzfWPDB/Fy
	 kZmNDYFy8d9lB+9M54YeYhBP7jSFPu0/rTo52XUlh4+DGF1ZxHn+fR9gt0kDIMVbDhRue
	 r2yliAxvxmZw1kL9foTT3qXBhFIibsnD4s9hV4fIs/jWut9MW9Nf3kyHX1thwJORniQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795431260;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=PkLX8sbZxWk6UF/rSo2MRFyGjin4KpA4Bp9VbTPkNFw=;
	b=T7ZqYVJBn0/6L+IXuqmRQmhWXwwWivwYqtlZ5FghfJtBVodng/IUgYY4dtRxTReiLhct
	 3ThKaAK0CjNtB1/oiSVekbN9KPiXSepaZSeUei4W0SZBFXLbzCO4U7z4n8rEvDe4hvrIF
	 8PtL4aeRJQsKJQ/amXixuYlb04XYPyWR4bqSmIYzvDcLb3L+hiAvv03pFGnrdcw264Zpd
	 mAIN1xFjIlG7DBTMU5whOmAIFsbisqzpsHusVihEmD6eLlkgnb6hK/kf5JpEvdkFylD79
	 Sidjhssid3vCvQwW1RyyDaVTgS064Dkc0ZCBY5OQK8DYc7w5c1K5kXERdyVvGgqbTqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Y7bQz0lB;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=CBoboIS9;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F94F606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 10:54:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F94F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Y7bQz0lB;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=CBoboIS9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795431258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PkLX8sbZxWk6UF/rSo2MRFyGjin4KpA4Bp9VbTPkNFw=;
	b=Y7bQz0lBKpv9E8niAFZ11TAdKzRQT77C3QOq3ZANYSsvMVZuK8To0Fs4snEoudmVSpCm2X
	K2hV/ApVMWksN2LAGX+We3IfcNhsLt4UeBVu+Seu3k+DLgfsHfIjNQylyZFRjRvMIk9mi6
	d6tlzUa76nvFHEJe58m9nhvjwHIAIPY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-326-Vd1y43-YNnqWUnguP9JNsw-1; Mon, 23 Nov 2026 10:54:15 +0000
X-MC-Unique: Vd1y43-YNnqWUnguP9JNsw-1
X-Mimecast-MFC-AGG-ID: Vd1y43-YNnqWUnguP9JNsw_1795431254
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a16dc2323cso2925465e9.3
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 02:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795431254; x=1796036054; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PkLX8sbZxWk6UF/rSo2MRFyGjin4KpA4Bp9VbTPkNFw=;
        b=CBoboIS9KWx5z3uIqcfQQqZ2WTP+P4TsFEece5Q9TjrKd2VcMeAS4GQUbKcrTna1eG
         z6eOExPB0VZfaXerV/PPYSv4mWMxRxbvOD1vuSAqowxt7DwoimwP8i2rx6H+Rd6hEs6N
         ySkAcHaMD4vIbfMpqIjs9k2YmkbSsfJvN+Y5AXhtT6JhmTZ/5RreTYz08QCwcVyHewES
         K+AOZVMxJgQ/6chHowk4oJm72wDmqTpRj0r9mhQ/QA5cccxTbRjIpU+M/9Bko6J9iHtc
         BuU1j8sfDRf2z56kQU5ReLodFAvBphlldZ0WtbNggRYvBPuQ+Io/7UfkdJZMM37RszTt
         wlCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795431254; x=1796036054;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PkLX8sbZxWk6UF/rSo2MRFyGjin4KpA4Bp9VbTPkNFw=;
        b=gjFM2NfdQ0Yl7ZU+vb0uoAJujjO65OijsnqHQcevLn8l+FisbwB6oF4wIrEyIn46lT
         fnKfkOjjiCGNmE+6VF0bWjdb9fry2Rst57DYgqffEGmR28o5378snFOjmw1wO4sZx62v
         L0mMpmXzP5kgXM04Qj4CI9Vw8AO6r2LEjZLYW0Df/JyPWDgvGnPR6NvmxiaWrIUYoQgf
         OsrQBZ5WqaczsmGVl5zg8uPcpsekIvU2g6EIsjhLG/36xwPuW1saonjEVREt0DPfbfMq
         XtmB6RppwcqnRhFpl3a8Ec/XopLw7/oz9s02FABtLp0iqOL94BoIMxYUn0V8QsDhv/QY
         raIw==
X-Forwarded-Encrypted: i=1; AL+hErFHKsK6miTF4WXJrAAKhajaHWPZZcQ49lHtXHxDFs9/nkLvohon8qMt4byg5+QyfVCOWgYOiDw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OB7Qe8VCKdvM9hSgxErtvX+3XcLSqPZO/voBOCKn3HkL2PG5e
	tnoi7P5LbgSll+F6E5iKi9M19kwUDect3OOVxIIaBx7uKHIUXbywb41/d4PZzy/nG9IIZdXaAxR
	Xh/4axTmSHNfEh7NUPKz2bCBUtPN/wZvweWvZX2RKTFWjCqrMAhO5JDWwTEnXwpRKvg==
X-Gm-Gg: AZFdTZdoXYcZdu/ZnLQzUonZA6yHC7waFaKJRKH0+wYtnsHIkjCzPaWIRWi3U75/lDT
	n7h/zTW7osEED1LF7DMsMKoNEfd2yqAuZ1h2yNar3mxlnGlUUP474PIX5WY7+pCU327Leiam2Jj
	VIQRtEkzjuIT7BmVz0mJVbsbcE45Pix56Xf1xqIrT0m7j4OcnDrCGjDUTih5QFcXmTNNj05IVsv
	iQQacdGT/6fQXeR30jf+90x4ZRixCO7jcOViD+EYwe7LixzXU29zl4Q39UOHhBR1dLHCXpLtS3k
	lDErQyKiTGmMRaCJkoD3XQMgXTeBTWV7MQUDf5/Ckd4ta2Yx1EthT5edd2oN0iQhWYNlJBgiYoz
	XU5OC7NjOOwqNAcdvZ4jWn8flpG+KANehgMvcSJXGAvr68f4hHUyCQ0JhAAdxZITW8m0KrM78mP
	ShyTEq+c6mMJgPlZ6qSbKwZbUBp+FABJWbtpAXXSIyXyUg
X-Received: by 2002:a05:600c:e41a:b0:4bb:9959:54b8 with SMTP id 5b1f17b1804b1-4bb9959552emr43889565e9.32.1795431254209;
        Mon, 23 Nov 2026 02:54:14 -0800 (PST)
X-Received: by 2002:a05:600c:e41a:b0:4bb:9959:54b8 with SMTP id 5b1f17b1804b1-4bb9959552emr43889245e9.32.1795431253871;
        Mon, 23 Nov 2026 02:54:13 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm386701665e9.10.2026.11.23.02.54.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 02:54:13 -0800 (PST)
Message-ID: <b50690ff-ed7c-4182-83ba-80130f310dad@redhat.com>
Date: Mon, 23 Nov 2026 11:54:12 +0100
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question: netdev-ai AI review embargo changed from 1 to 4 days?
To: Mieczyslaw Nalewaj <namiltd@yahoo.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
References: <8778f095-2903-4677-be82-fb1bc8284100.ref@yahoo.com>
 <8778f095-2903-4677-be82-fb1bc8284100@yahoo.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <8778f095-2903-4677-be82-fb1bc8284100@yahoo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/21/26 03:37, Mieczyslaw Nalewaj wrote:
> I noticed that the AI reviews at https://netdev-ai.bots.linux.dev/sashiko/
> used to be embargoed for 1 day after a posting, and the embargo now seems
> to be 4 days. For example, the review of my series is listed here with a
> 4 day embargo:
> 
> https://netdev-ai.bots.linux.dev/sashiko/#/patchset/bc42ae96-dc7e-4b6e-b9cc-64cde5dc51ce%40yahoo.com
> 
> The series was posted on 20 Nov 2026 02:21:49 and the page says it is
> under embargo until 24 Nov 2026 02:21:49, which is exactly 96 hours
> (times as shown on the page, in my local time zone).
> 
> Documentation/process/maintainer-netdev.rst still says that reviews are
> available after 24h. Is the longer embargo intentional? If so, could the
> documentation be updated, so submitters know when to expect the reviews
> and can plan their respins around it?
The whole NIPA infra, including AI review, is subject to quite significant
and continuous change to try to cope with the ever-increasing ML flood, so
no rules should be written in stone for the foreseeable time.

The embargo period currently aligns with our timeline for patch review, with
the declared goal of preventing re-submissions just for AI feedback' sake.

Cheers,

Paolo

