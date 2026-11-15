Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794786284;
	b=W6Vajzvirmw2csBtf1xUgCY9XDqxt2+8ZqZivpYBb+lfZDDIRWTWU+cTwhsJS+Shi/dU
	 GxPDSvmbQwpXe7dxJpoy+l/u+Trdr/emFi4S3TViDKBDdalc88iHd6LnexTJbjVRifz9o
	 nORN8higc/RY8bMoROrm9qVcO36/aopM+OXhxbYHh2XLqB9xn4vqKX5UCyUV/cqKq3uMe
	 85gM6EeagZFTN/5yTlUCz4YCLu9UxCAzUFsN8siBnzUTuy13+rWDaOjz8/mH2FCEVNg5C
	 p0dvW/277MhapNp7xyO914bK9aNMycMpybnVjG+CFWnDetnt7UU76wlWT8WOHiSfsNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794786284;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=4Yyald/k2SpE5bBdBLoGU8cqFJpt1zNGrikmS9/w2fA=;
	b=EL0cf/6RnR1Elxw/vcYDzZTvUFabCDzUI5nXoh6jnxY9fztLUW7M7cqNHvs8Oeqlk7kN
	 hN6NhQReQD8g/iJT8q14JM3Lxmqo5zfzLCZqyumT5w8VZfHYVkv1+WNB4mPsjNN+wzm0+
	 j4nGaeJjadhp5wwP64ZTR7a5rUXA3oyk6mvfa45utST2iKmhl8qsY7T0fJGGnHI2TRRxu
	 qLxNrq2LOa46OouQfuYQiZTUk3J+iOnNWMr1isbGb3RsmkCkoSbPPbVoLv1okLXxVOGGY
	 wrATQ+MnEnYdwGt9m55x1Gjehr+BCqqZrKyEuxh8DocBhRX8pPm6Uluk9/LrmAqv3zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lFGDgQwd;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16AFF606A323
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 23:44:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16AFF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lFGDgQwd
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so3724475e9.0
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 15:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794786282; x=1795391082; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Yyald/k2SpE5bBdBLoGU8cqFJpt1zNGrikmS9/w2fA=;
        b=lFGDgQwde8oaEpGgZg5OdthYNSMH9GlXKUXhhbKrSbrlTyIdEooDhBdfpEkBh5jXXC
         7hKzUNBveAgzmr/ptZopXmwudejrsNZ+aBZkF/qAbJWFRHlscoEUmOdvCUwp8hbaRXqi
         fNUkQ1h9uSf6ybdlK5z8+C9KESoYFdDlQHg/B6ZX6JeklK1qK7IaKW1BOoryNMiRSaSY
         wL/vubVwX6eUYhsIr/5COggndBs8exMepPJBsvsg+Y+9SwlX9yFmEwjofOiXZChGpicC
         FI0YdCFRfkOMUeSmdu/GA0iWhwt6Wx9RCsEapkHDY/Ml1Y/gvjuzwjb3vVXf+HLl8qgn
         JdhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794786282; x=1795391082;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Yyald/k2SpE5bBdBLoGU8cqFJpt1zNGrikmS9/w2fA=;
        b=DfRYJzLsz62ewD4TFas0eRUl8xRB3Q87VezzG408ViFvmFZBh9j3vSMoi1MtpW+zey
         OsuVxxdPd13hGglRX6N2hu7KyR5Ng3rvRiITmJHcQS90VPGU/NKBqd7G2JC8yrT271bl
         jn9m2Eyfj6E8W+gx3JKx3pVtZcxr4sDW8x1BKuYyLYxF1NzU09P3H/3AzQvZ5l4UAwCH
         7P0dsRoRqE4kZZWBi4Awx0Y/n4CC+xFR/hyL2yrICkhEF1CIzI/v4C+Ly5bhcZap4bAv
         Vvg28kOefRjQzWt5RUJRN35c+kUZVWAgIdZ+eLEFvXKNpZnDcAam7fxHz87P+ojj+E6d
         e58w==
X-Gm-Message-State: APuU4Z+FnLoceToPtg27ZW45YbSRdntyyIf6S1oVRTuFZ5kmVZAEhsOz
	At0FjJ7eK4NreaiI7u75iS+hhcGFwEOZaemQYE34/iXzjJC/nxfzlFW9
X-Gm-Gg: AYBFou3lJ2r6IAAgLmT4VHsAg76ghGc1pCcPdyJxnvyKp0Ag+sC6N0I+EKKQgV+Emel
	3B1w5ec7F850cmoP9h4oaxYX46XyjSA/W8US2HD2rCPrQC9+370/0A+9oD3tBo6QjxvZGL1etG9
	O/50k6b/MZfOJEbLYTj58UIgEr0nYujSshbwiv3wemF9yYEzvwqWLKxEi50VA0gcB3yahdmYx/d
	Xa9pbYOJswNwl6I6kSl3Pk5400qD5poU/zq+lKw0TAa/kBt8pRjG9pvdVVpJwjAlg0oXl4vudaJ
	6HolJxxHoV/luQ2KL2HTdWoD3qsw4+DwM+G+d23pxFB+4T53SNiWnbzRQNCmRrOH4YkHHY0aQW6
	6C91Mv2XUj/zma9FdYtQ4jXotBY8TFkZo2tEw9emB8YIvjFknt3CT6L2HY089IiegLJfy2vwm5b
	6CnTB+SS7bNC4OMOoo+wAubS/7GRTnYwHbqs0vN39MRBJeaSgurB4a52fX8NU0XWvS1rUlUf2Wa
	JbgKg4Fz6EGXxtxiHqEsnltrEF57J+OrAtdHJ7UXZO82Eokebso7pbOLFmIIcWbWgsnnN9YzacX
	AmKEiaW7DMMv7exK7r807Tb50ePGtEgo7Y4fx7G6Pj6vdG8a+l1yiCrSszmDzi/c5Uu0aO0rSjN
	H5g==
X-Received: by 2002:a05:600c:628c:b0:4a5:26b8:4507 with SMTP id 5b1f17b1804b1-4bb55a7f827mr196246865e9.21.1794786282330;
        Sun, 15 Nov 2026 15:44:42 -0800 (PST)
Received: from ?IPV6:2a02:a03f:a75e:9a00:dc16:e6:68d4:aed9? ([2a02:a03f:a75e:9a00:dc16:e6:68d4:aed9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb65ce005bsm164069805e9.14.2026.11.15.15.44.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 15:44:42 -0800 (PST)
Message-ID: <d520d0a9-4f10-42a4-ad08-6a1080226626@gmail.com>
Date: Mon, 16 Nov 2026 00:44:41 +0100
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
Subject: Re: [PATCH net 0/2] ipv6: drop encapsulated packets when no source
 address is available
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 andrea.mayer@uniroma2.it
References: <20261115000047.14669-1-justin.iurman@gmail.com>
 <179477328585.3291.12843361003997824029@kernel.org>
Content-Language: en-US
From: Justin Iurman <justin.iurman@gmail.com>
In-Reply-To: <179477328585.3291.12843361003997824029@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/15/26 21:08, netdev-bot+sinfo@kernel.org wrote:
> Hi!
> 
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
> 
>   - How the issue was discovered, e.g. hit in production, hit during
>     development, syzbot report, manual code inspection, LLM or static
>     analysis tool scan.
> 
>   - Whether the issue was actually triggered, or is only theoretical
>     (e.g. found by LLM and not proven at runtime). If it was triggered
>     please include the symptoms, like the stack trace or kernel messages.
> 
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.

Found by manual code inspection (had this one in my queue for a long 
time). It can be easily reproduced with a node that has no usable IPv6 
address (no address on its interfaces, loopback down) forwarding traffic 
(e.g., pings to make it simple) into a seg6 or ioam6 encap route with no 
tunnel source configured. The outer source address of the encapsulated 
packets is never selected: ioam6 sends them with the inner source 
address (i.e., incorrect), while seg6 leaves it uninitialized (i.e., 
packets dropped as invalid: Ip6InAddrErrors).
