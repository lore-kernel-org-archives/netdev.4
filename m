Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794827172;
	b=OxsG1qouuUjdrTSCFaK3sjntEMDnt9N6dsP5DOZRkNxKEbK21Vf61NdDyWOwrmwndYp5
	 DZh6byKw4UhboJrHsCK5ECDT3qqDB/oun83sM8mQJQJKr+2JMaPnjHmqaqu+U81idYmS1
	 oRjYBv1y8v30X1c9K54WdI4Ok12PSPPuo1SdxB9sYBcMxxdABrSY76seUrgkQEo+wKbJk
	 GPZgWfbSio+rlGU87MZA1agf5pYJ1/yvq3MDcbx713OWMnWFlrna7Qg2H2ekINWoih4EF
	 rTXL4Rg0ASmm8IQ5GcOZZQWznYL0wELurZtiH7jYTA4nzMXe5LsmGWLOXOZgUiSXQ8A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827172;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dLN8aiRoaQl9Ve8XJrxdhrN1+k0tOuthcaE5ENMWVqk=;
	b=RVDpJhLVM6zPuiij3tHupGHhJMMIOTysJRCxtOdrf9a/PYLn0HQAqTI66cZ3ggKcX/Xc
	 nFY9kx1Id8fnkVZnfFFL/SgNd37udvXCfjWUza5v8e+XL+tACD8lV5L1eslSz+agabQA9
	 EQjDuFucBBdd5acCwYYpPC3YL7MNUXGriHpYGfFx7iH7BgKsGXXAtTfv56SMiUovKPgj2
	 gDXce5wtLRTh1bQtfNWfRelrqwCKC4PhDp2vGnFe+bU6hDoAZhPO4S8Ocrig1fY3zONrv
	 vsyUvgQDFF64w/vPPqjiyFlV5hBxgHX766plmgQ1cha0mdzz/4D22rBZPdJLvXGLFmw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MM7aY2mS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC55606AB5D
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 11:06:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACC55606AB5D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MM7aY2mS
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ae1fd4252fso31817611fa.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 03:06:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794827170; cv=none;
        d=google.com; s=arc-20260327;
        b=OqaAiwAbEiqEH3NWumI3Klje1x5EKpKHAHqTlB+/Q+2oFs82PIm1kYiIm+Sz9WIYML
         1d+Kk4ATJeZiFbctSac+RZYPVTbKGX+Pqx/z5ns2t9sange1gxdnvN+lPBA54uXtY8pj
         u79NuC8HH4v3JHkkNi20rEBf2EenNc82y36wkKa/vxGEiCSkGuWiCYLwTdnZW3PbTeH4
         WDvOyn2XdqkLM7HweUUm8EY+YMaqSP8wdxzbFwlMNIPtrHusgZq73mNi7OpN/BcgJHwX
         zke7OhDEJ28tOqBlPKstct7jZ8sEJTzan2uTKqwI7ruZApEGh31f5Bs3hlytZWSZSkU9
         seQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dLN8aiRoaQl9Ve8XJrxdhrN1+k0tOuthcaE5ENMWVqk=;
        fh=jc0ePU6naYlKHR+Ryl6QisYx1jf7ekWNbaMKh90r5qY=;
        b=eSCeUSj9Z9IPtpmfGV1Tlbj3LR0saENQVsuwZNQ3rssctTapGoMmbweP1x8IQfn2dL
         fUUQXeMbs8DQ5rPK5H4+DOx4L3LH4wZxQMDWQQyPJa7FnHPRheImGE8crKZOvhYjcO1J
         XqMEMIKzrriiH/JBF8BVnTXrlQORqFA0dWCbTS4tkehLY+q0FEXIGBCvOEQEfLF4NFR+
         A6tpbHJpQ8v3bkkpv+gzZAJHDcl7mSoysjMOvutO+I6PtUggS6VQSZTHmhiM2Vi63Ewh
         kWDG0QpQZVuPZfi6rRg4g67H0wU8+4ml2fhExKdXsxmqvXlcaKz4mRBngvOGSnb29AYd
         GCgg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794827170; x=1795431970; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dLN8aiRoaQl9Ve8XJrxdhrN1+k0tOuthcaE5ENMWVqk=;
        b=MM7aY2mSPEIQVllfpNqh5bwQ6QbU+aOeRwC7qRaM5rD5klClW3/VM1rOJGlbmpwv0m
         VbNtyOjqW+qjIa1vdDiDqjyuaRF3LaV4qNsG+xLJu466G1oeke4oJZE43pyO0yQRXsUT
         EXcFxoWpshrvLyPuKlh+M9hHMlR+NYb9OUdmyOHG3X1p/36rOa/onGLUJwFABHG5nYPO
         YUsY7kfBvBV2IDKkzlQM83sk90sNxfmkYWOCoiJcrX7F0nB5rblZQOM1l2YAZmQ67cUv
         nCLtEue31h4D+xqdaWnii1YKaRjJqeLGkvlRmS5iN/ayFSNyU6VbiIm7scCBxpkcA2ho
         S2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794827170; x=1795431970;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dLN8aiRoaQl9Ve8XJrxdhrN1+k0tOuthcaE5ENMWVqk=;
        b=NhG/Mr7TXusPySpBP9v+hcQGU9/RJ4bpPX9waBJLTAChJ4q2R+Izk1Qhu4YPKYSlz8
         PJ3+Kzvbc3lxIzgbrRHH2U+hxFwvGcvOREw9mZA80uhF+uFL/CtDgfWcsQlgQriermsD
         BjoAFYypa+XORPkkQ+wctw6AuQIieYvVKV/EBIL9RSUahShKuBtxfSmTf9ZB6L8ncEJZ
         WKYYUgt06paG6dQvf7BYOSbzK2QDmkr2XfkCTLAJd6QsYMEk30vMB+1q0uZBCpP8CCVH
         0IhvXIB/oeOHIG3vKHeCeOGieFBD7l5jFTDqW4ZucGirf9DRBEj3TZcGpKnJEXkHFkDF
         DC6w==
X-Forwarded-Encrypted: i=1; AL+hErGmKWCO//+V92fuVaVxGuNEVR0t7ZEXYUFvB8s23K/LHpTswfA8eVoRHspGNHuuOx0VKf9tgS0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8f0ZLmxyplt3r0LtoC7vkNQ1hb9UZFOk7d4Ta9YyNB0NWtstkY
	/Euf46JiWmBZu1U4fVDVgT6VGvNbp9l91kTwcpUtlcd9YhB6MSeW8HseyNT6rGb+NSLK1qH8Y4e
	9rt+dmaUoib5JZpZVdR8GkYf8oButQiI=
X-Gm-Gg: AYBFou1i0S0gg6X0kskxvv/k6lLQbaUiDfO5oHAZpJ2fCWqKMQbHuFJMy81ts3BBgay
	Jsyz2TjVts3BhiVxkTq/Ef6X1TlJNqQVylYe0d2TIlqJ7SEpvwH6ia1vNjcAFSqk38eg2J3R3k7
	mUaR4E1+dgyF59epQ++C0Kg4MC8efuyxacGMj+9zY4dfafq/dn71f3PXh8UO8d8P5Ew3NGV+guL
	b/DKqRRSjkJmzg/TV3EfN9v1CN91yzPKQqD9NFOs6lWlILur0uWvvAIW/SwYxEFVbB2sBhCbJOT
	+h1IG+d9B95AvU769j91jzwWix/wGJ3wDYCgI1DOPbB/1rtA3B8xNYzCauzEaKWeIL6f/t1Pgrn
	keoOYP5+oyLPBhcmNzmS6dy0QRvpYTPEKvA==
X-Received: by 2002:a05:6512:3095:b0:5c1:4f34:922b with SMTP id
 2adb3069b0e04-5c1709ce6b6mr3796099e87.54.1794827169503; Mon, 16 Nov 2026
 03:06:09 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116101506.98853-1-theodorlarionov@gmail.com> <avrgKSO8nfTnv4iL@chamomile>
In-Reply-To: <avrgKSO8nfTnv4iL@chamomile>
From: Theodor Arsenij Larionov-Trichkine <theodorlarionov@gmail.com>
Date: Mon, 16 Nov 2026 14:05:52 +0300
X-Gm-Features: Aa3M54pAiVYB-SF9S5tDgvqy7iruWpi8tRRbNav85gpBLByNWhJijCPsvbACwPk
Message-ID: <CAEZyMPB+oNBrnxV09Ji-Ao7Bcs93Qg=qx0B_b=3ULFx3nEFo+Q@mail.gmail.com>
Subject: Re: [PATCH nf v3] ipvs: ftp: do not link expectations to unconfirmed conntracks
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Julian Anastasov <ja@ssi.bg>, Simon Horman <horms@verge.net.au>, Florian Westphal <fw@strlen.de>, 
	Phil Sutter <phil@nwl.cc>, lvs-devel@vger.kernel.org, netfilter-devel@vger.kernel.org, 
	netdev@vger.kernel.org, coreteam@netfilter.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 1:51=E2=80=AFPM Pablo Neira Ayuso <pablo@netfilter.=
org> wrote:
> I think this is coming a bit late?
>
> Maybe it is possible to check this earlier in this path?

You mean returning at the top of ip_vs_ftp_out() if the ct is not
confirmed, and letting the packet through untouched? Or even before
ip_vs_ftp_out() gets called?
