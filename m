Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795541692;
	b=32DiyfSn2AkcW8jqZpN6OysZhVqx5mS/1NqHeUPfrB6YE2kFOIdv6SSoOKtKbfsxKC/Z
	 +JbECNBZqq3FKAEcVq2CxZjmf/zTe9UmrBKHxVBH3X8CeX7GQf+VWvqAi8wlxurQu8kM8
	 SEVLZCoxzYuKHEbIH5Z2YLJ0iiuAqgYdglD6tNxpZFBGkOjRvPNGUBDSTE7BERyARAg1S
	 tsq9tIysvjIB9hizlmvI5kN22pciFRMucyyL0h7I6P4Q0x37Am90dKhoKHs3PBtsEjKCq
	 gOr0bbaT8jkH5IuwZ7DG9+IvHFEahJxTl8yliFdJeGl5/5WnigTOYTyD3x6nhmmei6g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541692;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=XBmnC24W8AXYN+2O9rvqWHkGjrVBXCobhK+i3wuM79I=;
	b=jk/SEJdomfIJdARDAUthXsugZiKoPOv9/Qp/5pry+Gw+1CX4NiOJnUb5w+WMo4qzMQCi
	 tv5ULrG9EEH2PZTlYcQlEzOgKQ0RsqggDjYqjsdCKCy8JB8YP6f0e33sXJUR56Su4kEKX
	 t2+0SoXVuU4SXqRYq4UncrBduUV5U47ypR2m7uUVW/ZkXB7ESARk+L+4aheISLFemhu21
	 MK5nHQK+iwox8JALum70TxBmZ1jy+6SzjBFgEj1U6Tu5seoQZZ52HoXUsvbTAWbQ52jXg
	 H7Z1E2Yf6tEqid3VmlSjGRvGtYK9W1QMcgZYlcJvbmRVP4pR8w1L02dmeSDxG7Btkrw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	dkim=pass header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=HHrCeQgK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2835606A32A
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 17:34:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2835606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=HHrCeQgK
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2f04ad2c46dso28653285ad.2
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 09:34:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795541691; cv=none;
        d=google.com; s=arc-20260327;
        b=p1s16Eong5JMcRdhW1k2p4mlMT228jeHyMD+BNRweHrTOJAPEdnt518UEXIo3NGBGj
         yviJbi8QhJeqHu2tHqY3gr6p3U+W2WN7wwahvm48ojo+jyNWzsi4vIDjdx4OpIGkp6Bw
         UDLVt5pXtW59bo/ILctS80EuVMWVwNL+WYaZcPx2v8jVYb/2ZSYx9yq9OrbuWhI7f/NQ
         N9SpSp6gLMHemcco4/fdmEM55pH2aEShUbhhk3CK/5/4DPsEhBocgCz5E6koQ2t/wse/
         jblHruDmPbCwYAa3nQjAVijGoXaOLFb0zi9nWkfKoF3mOGpOsSPTR9U5ITbY1s56Tjbg
         Tj+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XBmnC24W8AXYN+2O9rvqWHkGjrVBXCobhK+i3wuM79I=;
        fh=T28RvhLxr1l9NSG8sMHJwoxGBbPy8Xu7Dd/G35VfKWA=;
        b=rrpXfKXVwSS78DJV7M45cgkxEUcfjzw/9JIAbfu1AX6H765hJ0wB4zozOAvP1pgR/K
         lD522EMFt9za8j1VztFMk4ltyi15wHVX8NAzcm7sHCZoX+IYlytoOHVtgy4EIPyiRXf3
         we08etu8WayOWyp04EVS3tXx0HEKjYFRMIc0fjQrHkf0HJGD1rZrwr4Nh6VbqUV0be/0
         9rr1JrGoO//J4XXNTPepU8ZBq79K4zKkOzQmqm0t/zsvKgkhPJMIf+fBqe/pSRkx5PAM
         MzSBpY9lzfM9VMtf/4iDlbep6LQ0z6C9CG0ERsWIJZ/WKWL5s/cEe7wJuQ8DcaXNonkv
         7IEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1795541691; x=1796146491; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XBmnC24W8AXYN+2O9rvqWHkGjrVBXCobhK+i3wuM79I=;
        b=HHrCeQgK/kBXJZ90aRHYJCoHRDaE82HsZ115cJLDYso+RPO71e0P2oCB3lgCU0MEgS
         vqh6phVdkz6ulUaoDB6e0l9qXvOSEIoCNR8KSiDiVRPP1eH/PJFHDDwfunnlA2EdZlpl
         IBc1H1MQCifglg++qUTABRftlRuR/pBz23mq1/edbPJ07HpWcQ/nQ99/W7hJb+mJamiF
         iS+HRsAVyYIlrP5fvIffCfiB9wn7spnsPetVxVjsy7/oH/YZVmk3MDTVudG9t+lq4Vov
         ZiT59zFmbR/7glqKQYhrwI/SlcgE56F6BJH34DFmhgVPkJwjU4EUv4gXctECwbp9F3xP
         kl4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541691; x=1796146491;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XBmnC24W8AXYN+2O9rvqWHkGjrVBXCobhK+i3wuM79I=;
        b=GRw5tGNcQACVzEgAR9XeNO6FbdiMzop8O69UGdQDoLIcIyd6H2NUU3hfbaSUC8ZI5R
         vfPDkjAqSfIxoFORzXuM5ZpacAsXHSrgOwL31Fy46gjhjTh2YwHsh2GzQXuqkU4uP9Ty
         JCmGVRGzevikP/5pTvuO0XmaPtIOiY+GvwSxDhvpIIoq4SK5ACHqjY+UPG8zm2/qP6uo
         Nx7XVyG6o/NsJkWWzTWWcQlvNStSxQqOXOHc3UQqYYdJDKKpHuRLElrfADOTTx2rVvZI
         vbOUlZmdTcOgN6iVktaFbFLUf8BwLN0Z6iO6gc7ET6Ynn/4e+OmrW5w4gTmDwTqdJALL
         EhKg==
X-Forwarded-Encrypted: i=1; AL+hErFe1t7VS+PxQb2mFuw0iT2+qcZMJt5bFwUOasP9vx+mwKoy0VXNQW525TOn2csbopDQKK9XJ3o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FwM4ULr6zpSRic93bk/9miGWQ1hvr9ghti/pgg9L2OborT3oJ
	vqS/n/+50JJmAbwXhq69/sW9DhD/87SEfPZvwTp1kJOtwBvXkzPlmNyR95EaEDOn0J/V170MR5q
	AtnHsdFWmmOmVCCVeg8muxm6YK04VVdG62+vF6juM
X-Gm-Gg: AZFdTZeSsTCZAHbOcqcsl+IF9puILuGnaT3BjEJlyFIz+eRyatYIfiZEftAXAJupKJ1
	z2D07R58so+oTMb4qD5NWaEPYvt6WNE2n3Jr0W7qwivDKlHmH8jM2+aofgj8EytHBr6xBdGwLte
	LLRbmSlHz139RyAmurg5K716imJzdHhp5Eff3nt9jBj/nbmkrKg6sWdJScaMtcA+XIQpQ9MT81T
	FzbIXiqUrPWwXr0AnfTBvSslkV10Q2ZKuR+2WjCsESHsTyhWDPMXurO4ltdSngAlP2Oj/xkFtKZ
	OqpEHU5O7oue+U+G2ByILggUl4gRpWJ6of/RlnrsJI07skLk9V1QS3WXt8Z3gZcN7yMskh8m0GO
	/3GuRtlClDBdXFJ+sJJBsuf1M0Yy+zkdAdhpl/RW+tDlq/10S+KxjP3lPZaQCcxRXf1TJ
X-Received: by 2002:a17:902:dacc:b0:2db:3b35:1ac6 with SMTP id
 d9443c01a7336-2f03ef5a25amr159510795ad.5.1795541691316; Tue, 24 Nov 2026
 09:34:51 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-x25-v1-1-4432d3892f8b@gmail.com> <c70bad57add6ff8cd52125c698f3f54a@dev.tdt.de>
 <CAHC9VhTLg2FLNf3sLe3+A=q5Mo4gKs+gB7zi5sQT1jizsOPuNQ@mail.gmail.com> <CA+X8SdjoyJT1i1Rf08psCsLQyPQ+yU_tAH0rCQPXpkm4DF_=Nw@mail.gmail.com>
In-Reply-To: <CA+X8SdjoyJT1i1Rf08psCsLQyPQ+yU_tAH0rCQPXpkm4DF_=Nw@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 24 Nov 2026 12:34:38 -0500
X-Gm-Features: Aa3M54qCAAAH8qnzn7NrvXOlemcU2WyGsLTrIJLHcpwId-DXnie5s0o5cb3103Q
Message-ID: <CAHC9VhSY5_NLka8n-yDVwv2FmXj9DF9PWWxomGv1_-mFzZ3Pmw@mail.gmail.com>
Subject: Re: [PATCH net] net/x25: inherit the listening socket's security
 label on accept
To: Wong Steve <shyckless@gmail.com>
Cc: Martin Schiller <ms@dev.tdt.de>, davem@davemloft.net, kuba@kernel.org, 
	edumazet@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org, 
	linux-x25@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, stevewong@hust.edu.cn, 
	kaixuan.li@ntu.edu.sg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 12:19=E2=80=AFPM Wong Steve <shyckless@gmail.com> w=
rote:
> > the x25_make_new() function is called by
> > x25_rx_call_request(), which as far as I can tell is on pretty
> > analogous to an accept() operation, is that correct?
>
> Yes. x25_rx_call_request() runs in the receive path
> (x25_lapb_receive_frame() -> x25_receive_data()) when a Call Request
> arrives for a listening socket. It is the X.25 counterpart of TCP
> creating the child socket for an incoming connection:
>
> - x25_find_listener() finds the listening socket,
> - x25_make_new() creates the new socket and copies the listener's
>   settings,
> - the new socket is queued on the listener's receive queue, and
> - x25_accept() later takes it off the queue and grafts it onto the
>   socket that accept() returns.

Great, thanks.

Reviewed-by: Paul Moore <paul@paul-moore.com>

--=20
paul-moore.com
