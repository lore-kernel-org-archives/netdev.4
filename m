Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795123547;
	b=RTj5VYeabgHJJapMdCSC1fXpCx8U/2crISkSTDLlkUm3752XWY0an6dL1TT3pvL2SQ8F
	 8pa7Zot4+C5HVQQYhwnuylNy7E75G3iFeXCg9jy4AcSuWkAZFq/hDQkBMnuepxysRs9sG
	 TvEiZ052GvYQlmSfzyq4JHxo5rk3hgY62o94ra/W5BJ8hCLWy/bqXxjapLD5CjsHOdVFJ
	 AQTxeKtZYQ9e6H/HCzrAARrqiYp6wsQ1zaSPa8rQVlkG7UsCu7CJR7lIEyKeMSFlOUijW
	 DdIVAwy5q2qv7Ie349/JttwpcjoO+2mTQbwlwP5g7JRdI5OxUre0lHkxNeNIZGN/ypw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795123547;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=L3A+83a9wCzT+86gHuUpOEXepXCJ0T5thB6Rt4gPEd4=;
	b=aHp3m4uXVyCvoH4Xj1VMvxjUdLXFSSV58zU6RJ1uxofMuwBNUFZ3RhVTeba9ELPwAKhU
	 fIHBafscOrwf5QhuGLfTWPYlrrszWR/3gXfwMBDxVz0hPeEk/I3lie8Yj1wLEMSvylrJp
	 u7sXLMmi7HYmTori4uOPDE0D32xF4jkXvQX8ofagJIT5yVHzmfMH6uFvHcrlmAlj8nDER
	 eLOcCoi1YqLORYhTYtqipX+eD9Ysr6W8lxyNJUS9LafJKk/8MO/yQyJSRSv/jd5YupNhC
	 v4S5SreFm3om/VuRgLrdueuH4ki8L23h9AXteF5vgeWDY44ILN1xqjymIIeipNogMhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rEWPSsQJ;
	arc=none smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013AD606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 21:25:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 013AD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rEWPSsQJ
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-55d03bfd477so2564461cf.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 13:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795123546; x=1795728346; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L3A+83a9wCzT+86gHuUpOEXepXCJ0T5thB6Rt4gPEd4=;
        b=rEWPSsQJu0DHzGPnHR4fUNkId0R/vH5k8iuqTieO4oFRVN9Wr6bJ2jRdJmRWIIp034
         U67Ce3A3De/ZQfiK3F70I2Izmn+Nh6u0X0rU1isSDp4b+RNakUt1fwNgRz4GSAE8nqcG
         /c8hLCmmJkjIN6Pptt6iTBvye4W33y8thEPF6arbiZ6rfpFL5jBGBVz+KMHLUdt141NX
         32EjVHbeID7WYgbEi0z2Q2pY9M5McaT8cSEYeinFBNl5SbO93aT6Iju8ucwg01mVLOl0
         X2pOMMLAt6q5xhSqpKbaIE4PREpMCtplAjqgZIZGvsW7Z8S3IRRmmKqUn0C4P07IAds4
         eyHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795123546; x=1795728346;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L3A+83a9wCzT+86gHuUpOEXepXCJ0T5thB6Rt4gPEd4=;
        b=dyKpA7vwN13Ab69X3954FgPD8dIRQe9nQagiEjYlfYWnw3k2hlbyYEHNiDPk1f/wrk
         Njt1Lk71Avp6LaoeLTtevYFlqZ3OOmmYp4mhIGayL2iOFrdO7TCxIncML1/K/aEMSjR5
         bRBSRAs1EHy88m795MMxSlEmQaiN8jqPilhTt8I/WTkQVPwp36u9lrUhURowwlVR/hlh
         AdeQxWMAxdfyFJGBnmNPNKGeaE9X1os4Bx5gs+wJ+wSV67xn2yvXiqG07Fmjo3id7pVP
         dMGvlW/iZHmg7uyYedSlH3AgEj0usltzFWbP3xgrbNtdO68TXxBMy6O4v1d3b3y/Ukhp
         8ZMA==
X-Forwarded-Encrypted: i=1; AL+hErE3HPc4lhWpWcVCvc0Ip3Kxc9KbCygxZMdIGYYlD/Exmtyp2/BkIyZ6siFtaJ51PtWpvAVqrjI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8U5AL3trXY7FT7luw0ZsEBKpHk6Hid9vi4cs2UCtALI27qpvng
	SuNT62qXc8y3k7AUFlLC1uL8ZT3CMBaRGocOFLpJo4J/KpYB4rE/JFnZ
X-Gm-Gg: AYBFou2xHgy67ynTqShctWjKxGODmy7SBnqW56OQwgfsi0vnUtpUEtgGyC+RqK8Rw4A
	GijGzMolJ7dYuqTfVjf0J+oO/4vn98KKfNbwj06TXeRx+AHSOOY2Ttt4lQstYA82LXsKYHMpsSw
	3xw3W5xRTJRsOp8eIeQtIVkFVTVtovgtExYHTM6Y3jANlQi1zU17BUebX3ZMCsOL35RXMloLnoa
	IcExv9DltMS8sDaZc0yXfTIS7hDNolYzYHLcvBwjTXrHB4zNJyrbQJeb8EnhjBL2oiMEiXlVpcO
	cQ0FbzowX9L4w079qprgSEfGY/fkmZCSwjG5Fc9UaUTXXuX45C4y5vSdhYL3kGrE0qTeqWqWlmg
	j29KDfjw70RnLSaCCTrpNz3aqGJ4PhxPLofuvCUj//Jf305If9YLPeeOcy4PFDUtZovycyELtxn
	C5Iwe9Dx7bf29jKpeQ6Bep+DKcEGN7pDNdAjTTF0VbQwfEKt5ARxsOj7OulJZ1T3BTyTsZLNmS6
	wi2/+6wZENhRkeMneInJ41i+nOqhVjob6TKZIsP/TW8pUK0dXr8TcIwVpD4IVU4qxLhDXACU4NO
	37GpjyEqKdcI0cihG50Kfewcm4XkysauOMxOEQZt4c6nASlnUtjQYF/nB2a/EXB98M7c/Oq6WnX
	SSLvtUGisci9He4umCYfc5UN5HTDtKnSxpBREp2HzAs2bbCq5xc4yS8BIsuDJi7KZ2LvLUNC/6Z
	YbWI2nkzGf
X-Received: by 2002:a05:622a:248c:b0:55d:3669:e04e with SMTP id d75a77b69052e-55d76a2b7f7mr22004751cf.22.1795123546011;
        Thu, 19 Nov 2026 13:25:46 -0800 (PST)
Received: from gmail.com (15.60.86.34.bc.googleusercontent.com. [34.86.60.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349b253csm8744006d6.15.2026.11.19.13.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 13:25:45 -0800 (PST)
Date: Thu, 19 Nov 2026 16:25:45 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Sangmin Lee <45sangmin99@gmail.com>, 
 netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 David Ahern <dsahern@kernel.org>, 
 linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Message-ID: <willemdebruijn.kernel.d6d50443276@gmail.com>
In-Reply-To: <20261119164351.49040-1-45sangmin99@gmail.com>
References: <20261119164351.49040-1-45sangmin99@gmail.com>
Subject: Re: [PATCH net-next] docs: networking: correct skb_shared_info field
 reference
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Sangmin Lee wrote:
> The skbuff documentation refers to skb_shared_info.refcount,
> but struct skb_shared_info has no such member. The actual
> field is skb_shared_info.dataref.
> 
> Correct the reference to match the structure definition.
> 
> The discrepancy was identified with assistance from
> GPT-6.2-Astra (xhigh) and manually verified against
> include/linux/skbuff.h.
> 
> Codex built the affected page with Sphinx and verified the corrected
> field name in the HTML output.
> 
> Fixes: ddccc9ef5599 ("skbuff: add a basic intro doc")
> Signed-off-by: Sangmin Lee <45sangmin99@gmail.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>

> ---
>  Documentation/networking/skbuff.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/networking/skbuff.rst b/Documentation/networking/skbuff.rst
> index 94681523e..e66adf19a 100644
> --- a/Documentation/networking/skbuff.rst
> +++ b/Documentation/networking/skbuff.rst
> @@ -21,7 +21,7 @@ to as shared skbs (see skb_shared()).
>  
>  skb_clone() allows for fast duplication of skbs. None of the data buffers
>  get copied, but caller gets a new metadata struct (struct sk_buff).
> -&skb_shared_info.refcount indicates the number of skbs pointing at the same
> +&skb_shared_info.dataref indicates the number of skbs pointing at the same
>  packet data (i.e. clones).

small nit:

    The `&struct.member` syntax is only converted inside kernel-doc
    comments in C files. In a plain .rst file the `&` is printed literally,
    so the HTML shows "&skb_shared_info.dataref". Since you're touching the
    line anyway, match line 18 (:c:member:`sk_buff.users`) or line 19
    (``sk_buff.users != 1``), e.g.:
  
        ``skb_shared_info.dataref`` indicates the number of skbs pointing at the same
  
    The :c:member: form won't link, because struct skb_shared_info has no
    kernel-doc, so the ``literal`` form is the safer choice.


