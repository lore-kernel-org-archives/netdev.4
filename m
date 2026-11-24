Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795518672;
	b=DA7BnWE56t87cXwOcn4hR/ayDKr8+H4P7tlac7uH835ZjB9dDU3tmU0U4adtJY/OV0ED
	 vhz2qWMLhN7dtgDDdvrkIMGgIm3LGtwYqb35keGrdxk/+JR3Y7wb8EUuIrrL7DkRzXxIf
	 CYxFupxoq3eq/IqWHY8lsQbrgZix3/E4yueWCcvc5uzRJfClEPzHdo+3d4DdWkZo6Xy9s
	 B44XQKyIgnOkeUU0AWfqQMc3ugBzHMGkJWGNbjv9qzUVPiu4sCaKRuecqSh/ymlpZ7+nV
	 5YTaBJcykJLTk20rGMLJ/N1e9EmuVMdrEOm368R95nnZm8j8yisJf3b7o01nw/edMOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795518672;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=t2at0oNmEktJ6fTz2jAVgHoFYZN4l8WmAMuyA5WiFQQ=;
	b=Xn3pzYOAh+X6JM+YgMxLRQIF1m8idD7XZKIjdj3d0BRzHgeEsnUwXmdgg+mIrbwyFGds
	 T1e10RXE+bUcc1SGIn8gXKU0v843RRr+VLPwnldtmpxRZB6nKUl0RmqIfP44Au8Fs+SAq
	 aNJ6uL0ZX3fzx5SHy7+S3DGFm8lypXR74KdFKNlkl24SvKSvr1y3fwBIzaU7G45DCrrpn
	 0sM8WWPm9wn0KdmBmcJBTNXnuNm5ruQMMbysdbXbzrYiYXijzAJrjyYxFrL+uh32f3Rln
	 P/5uNUjdB86Omb7jiM0ZuxCrZYZUnZg4YO1KfkD4W9H5tFmrGLOM0fag0jz60QW7dwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=UcnJHTyQ;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB4B606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 11:11:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DB4B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=UcnJHTyQ
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e46e449e8so2788768f8f.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 03:11:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795518670; x=1796123470; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t2at0oNmEktJ6fTz2jAVgHoFYZN4l8WmAMuyA5WiFQQ=;
        b=UcnJHTyQiH+pKFVhR73XzeT85KeSi92KVWmgCXQdae9Iorf7if3nOhlsvuGVx3zgnR
         3I3oHy5W9T2Ov4uRkRfiVlOVshc2IG7lp0WiaWnmG9FMm520X0c+I/g/cq7uhwnFsQdg
         zknf/Zf0WKLMy38opavOI9WQdshHATN9mpQfg/u4JnCn7ShBDgSeqR8gv2I3evbY5Z7f
         Kw4IXDtUhHXpn91jpwhLNI+sk8j9s7fuwnMohaAaHvwXbuiC1je1zXLI7b45DDwpxUPL
         hqYXeckrkBKMd8s56zpcNkHGIA3vbIwciYPXpCc6GvN0XKfUjqoe4i8r1liUGfggMFJV
         f1rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795518670; x=1796123470;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=t2at0oNmEktJ6fTz2jAVgHoFYZN4l8WmAMuyA5WiFQQ=;
        b=KBc8yfgi5snIY+oRBF40F/6YcMxXnRyi0nr1f5oPbCB25Hh1RRFhEMIUML2yyHY/cZ
         Dn/E8cEY3mnKxySDJe+Pxpcn4KElA4LRdJZOtQAwCly2O/pJsUfkPM62WSvKFMwPyUb/
         A+tTK1PvSer7oMhMuXx7WTVCHGqU6TjDqkRq5z+RILDuXgPaTc0MQ9xqkaBfAGaxzLpL
         V0KMFnr1vMWKn2fev6BVoDdVBa2H66mcZsAXBY4edmSvqHXHB1Ok0rYh3tQ/XteUnNWO
         w4si9Qob5N5WWSzaJ04UiNESBF4gVKmdZiNPkYaceYGaBDbfWWbGDMA1aXKDhtuTz97m
         hXRA==
X-Forwarded-Encrypted: i=1; AL+hErEpdy4a+V24Nt7S878Xb0ImIcdVA9CMw5ksHOwoXPOzHHoIsXkQHpwkaRL/d5INZphez7urERA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LhEzCRJQxhV03YZMCOMZ3/NNwUB07t4tTbEbjSemy40dYJtoL
	J3DvAshenvKhz4cN2Jlp/1qPIm87y6Mpn7cageO+mrzpHZzLnQYTutysqMb6D6BT7lQ=
X-Gm-Gg: AZFdTZdMaecoQ0r59NkTYIyiskATpWvsgcFhIP/y0xksK7nqzKUe9ApD+zCbwMA9qt9
	oIlSrQJ0Es355hGEd6HQzmsiAeuCdFbdzMkXznq+mmzNCuSaij8LAHZrRhif5LiUrSgUzKi6Z9H
	gT39OokhFMjVTh1+nwHw6P4bhJN/LHh91DlKFApy1KuBYNHgq1DFFCNUbBCko271dykPV4hLyiX
	q0ZFT1MnG4SvKQKLHRC/VdmQXEHBx38RRz25PZheOgHM+kQZ6VWHaPvsM4EiKb1YME+pB9/Z08i
	YKDMWAd6dJ9G5zwcBMFmWHTf0vU64EHcqJOLrEurz6VUb/efy64Jcw+0/+O+QaXEunOIECV39lC
	9LyLWwOfmSfHpaPe1RGsNBDfxZSatip9yYSdHQHxonP1pUKgA86Dt5aBKfiRGLwJKDXA4ekyCpC
	ci6WCM7SXkSO0rJqV2VMOoafrgZ8qgojQy/RHsLYRlu20/IAkSLDXlqmJ5hUOrEwwhtibQ31i27
	OD0HnOYW5QHnpAzkLd1RCrEbs8q5/HscZ97lxnKFIH3Hbu8zdYecBuIbFdh8ewv2V7T+PncCtLw
	rdA6bqTudAGpI9G4uJlBad5POIHfPztJ
X-Received: by 2002:a05:6000:4541:b0:48e:6264:c373 with SMTP id ffacd0b85a97d-4abb400bd81mr17140230f8f.14.1795518670500;
        Tue, 24 Nov 2026 03:11:10 -0800 (PST)
Received: from [192.168.0.20] ([212.21.133.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa397asm28151271f8f.48.2026.11.24.03.11.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 03:11:10 -0800 (PST)
Message-ID: <ffdd26d1-4316-47ad-9ab2-9a62b94bd2e3@suse.com>
Date: Tue, 24 Nov 2026 13:11:09 +0200
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
Subject: Re: [PATCH] ipv4: fib_rules: Switch to using a for loop in
 fib_empty_table
To: Ido Schimmel <idosch@idosch.org>
Cc: davem@davemloft.net, kuba@kernel.org, dsahern@kernel.org,
 netdev@vger.kernel.org
References: <20261120081242.318541-1-nik.borisov@suse.com>
 <20261124110317.GA3761951@shredder>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20261124110317.GA3761951@shredder>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 24.11.26 г. 13:03 ч., Ido Schimmel wrote:
> On Fri, Nov 20, 2026 at 10:12:42AM +0200, Nikolay Borisov wrote:
>> Since commit efdfb1e27a33 ("ipv4: fib: bound automatic table ID allocation")
>> added a sane bound to the loop looking for a table id the concerns in
>> 58075ff523af ("ipv4: fib_rules: Fix possible infinite loop in fib_empty_table")
>> are rendered moot. Just revert the code back to a "for" loop, using the
>> new bound. This makes the code's flow and terminating condition a
>> lot clearer.
> 
> I disagree with "a lot clearer". The function is tiny.
> 
> Please read:
> 
> https://docs.kernel.org/next/process/maintainer-netdev.html#clean-up-patches


You are the maintainer, it's your say. However, I disagree that this 
patch falls within the "cleanup patches" described in the aforementioned 
link.

That function is a linear scan in a [1-4096] space. I see no reason why 
a linear scan should be implemented via an infinite while(1) loop with a 
terminating condition in the body, when a 'for' loop construct is the 
right tool for the job. Anyway, as I said it's up to the maintainers.

Regards,
Nikolay
