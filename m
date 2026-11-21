Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795287543;
	b=jIn/8MVwF458BZZehbJo0TAODknCs7RWucPmh/iIzN3HOTMsRkZptAN6PkSH0mnZM9uM
	 OQKhh7W/d7AlDFiAgoHh0++Kjn0/jfcJ6L/bk1U8c1GS49uT95hYopAcXYzMxanq3Mx/9
	 RfjUNK1431ndypHtwRqK2xOTr+aatPdFCaNPCq2hvA2Jytg+9HbMnyLKlKnZoPXdTFO4B
	 dOby7LDuv7DK1Dds55Cz3Kj2IsAVUIYjxTaUhIh1fn4OipKLZkc+InoyxYXknxAtEJd/H
	 LW9PTqDqNjevWaygls/plyeT//ZwXGwXYEf089P+EvNhxz5hRhd8qPcBr91v418edXQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795287543;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=S0mqANGQUFt1PhmFOnKITkgyRYJ8z4qi9DT1+JIbPnc=;
	b=tZJa2LqSUD0+ytkxZhbIaq8WwObweFfzZ6HzUs4evNg3kezYD1aPy893E34U2lE8I68z
	 1cT4SVmjQlSHKXzFOtHMdQ/VjgAryBzebj4ZCmWH7y9wOpP6RUXgBm2a1SzGjNVKUoV1o
	 PyWzlsnY3pKzoW0HuSkpR6SZiTCZ2oYKBD8bNAbxpqCfWCT9PJf3E7Hc+flB6Uc4Ddom/
	 ncicaZ5wzzf2F2nIHFSVjAukCmNlZ4EvsIyjpjimoMtIyVvOSRQxk3IBjRn3Qczv0dDc/
	 awPdq90z+wkl1FryTbGKBSVy6d/bGHqUkfdG0ZKJtxfygie1v0VJcPhJ6qDGTUw+LOQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x8WLUf+n;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512DB606A320
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 18:59:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 512DB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x8WLUf+n
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-67583c777abso2027984d50.1
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 10:59:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795287542; cv=none;
        d=google.com; s=arc-20260327;
        b=CMQt31Bm6Bhz2ko0bIJ7gtB1uceiBqqFoEnXfbz4CU+u0VCqIqURqZEC3baQfcB7tI
         wif7zvf2h0rBmytwfu3bw8rECRqjreVFEUD8TO3xs1xGtvRUZYmvp/45zyJ8TE8L73r4
         YHiGATipe4CGhnEgTGraD+4of/P/VFlKNA4N3ObKSZRvetB4hEINt7to4Oyi+ZOS+oas
         VpcfmVVcE/KarjlIralnrH3etI9fOsMJNqo793wAoTJkVPXpLp57CdIclb9qrCKv96Xs
         RHM/VdHRI+7L9iVmATRTEIpFgoWqvPPYIl3LN9pQ9S5W2GXzKrd1btee7elWH4GcnURL
         utEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S0mqANGQUFt1PhmFOnKITkgyRYJ8z4qi9DT1+JIbPnc=;
        fh=AQ/DgPqzHvkpo6Zop9jIvMiB/ueiz42xa+8FiTvHjnw=;
        b=FJlFbdcooA33OkjByXIJZqFg05EKURDaEOEju/RyKOzudWYkkdIXwynJUZG+ygz/25
         qM19jV0uaIDri/tEg8XYjsGFdICTV/4iTNokf8YGcVnWQAwcmdWGPaSCrGEkUyExrYF0
         wFwj5fVkKXNt9t0AYT5t9tavadg8KK21XEn7s8yNcOjBPCmo4ujbzr0csCceDbk8gOBM
         SwlAosAB05/iQiQRRdjDeH4EVRuhEecSPXcHwfRfhba5M4w60UcJ2N2AsDchI3cGUKj0
         c+Z8KEzAZ28Y7mBJdcEvELTG6SjXebh0YV0jBK/YT5A09QtEpMkDT6rv8uVzIZ/okwGg
         1Jxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795287542; x=1795892342; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S0mqANGQUFt1PhmFOnKITkgyRYJ8z4qi9DT1+JIbPnc=;
        b=x8WLUf+nMMv9D2wcLvQXB+6pI07weakKB4GqPNb8aWPg33o0CHvXKLQyp2x2NMZpV8
         4xiwnWUKnFGPPPx6hMYk69uwqviYal7F0h6CknGdHIEQEKpr8d9KAcRWZ26+nZmGUxLL
         Usv7v+NSLUvqFykC4EwR5xdpxYtddUeqtVF2tXbRXt+jMsDQbR0TTMPLOT0SnYq2Abfy
         SmduXFxE/LPRyFE2BOyde6qlQL7DLINGH0o84lmF6m2eZKmI8FO5TYtNq90lLE1tf2IO
         vD10I9hG40B8BmV17rhGeyQdAzYosODj7CniNfCL67LE4+2t8635sqiBgk4MLHlX+lfK
         1HQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795287542; x=1795892342;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S0mqANGQUFt1PhmFOnKITkgyRYJ8z4qi9DT1+JIbPnc=;
        b=hE5X9px5v0WTe5CCUm6oG7guypGtCJOmVMj1y8WFdPdWQ8NjfV9jPQj30AuAAWMDyb
         MwGcCBCkvd6G9H9byonlJfcIrwbAbBGzCE5789PwvYBVZxj+k3rBBcsjrYSiTkwDjyvP
         1gZRgFrBGzgIKMcrnsRcVMyOP9ljD16e2NbmzSHtFyl787KyF1K4YuONtdfaFfDvp1HK
         bVKwhW2ygQf5MgctXo/I+TZIC4x627h+Q9YdH9dDDSRa2zI9ihbh8Ua/NdLvtmVzC8mP
         LxcH00zSwDXs0iufW/TUeI78P/pnQxEUV8Th6OkqJMLEmRgG3tQ1gKYfPp67RtNcIDe1
         DO5w==
X-Gm-Message-State: APuU4Z8tVWUch3wglItTlG2sGxiitWWi7Aa70Iu/K0Oxsg/PGrWEmxLJ
	XaQpe/VOhk3dBTDZ/uYH9u603iRwLSbqQs2wA5pedV+S0bnZbbedViJqn7L2AQTo2thcWeO0rry
	gQxcLb37yfC5XCkcYMHPoV2nfx+ssMNE=
X-Gm-Gg: AZFdTZfH5EtgRZ7JOokzYHfDPcnXb0hiH0grhiFRrtKV1st0zv87R1V9hDUHtJ64B6c
	qflq/IsXkCK6qP5B36qBQ13hn2bojC2y0unacTY94CAJeOOC2+nmePsfYGZS6+xw8v3t1DtzaHf
	vIdqywjBRzNlGT31Wdb3XBe5n1ehpnGXnSTjR9oLuqyb+0W61tnjUtuQwiLY/ogXU7pRJViOZAI
	/OywUvmZ9yOAXcvNKrhh5BZNZv7jY4Q905zyCKMlqoqADYV22jeNRBIwMj4vVDgNgUIAt+9usO/
	yxmz0+RBt+EEo/EciAR1DP+fPxXGm9f/n7d6s6DdZeHh7xvy1xNXxvF6F/MOVYxZ43IAjFA+wju
	KcaAIkhsJ3+lqDvUvHv7LxMYymWtJvO8NqIoDf8sW6hEj9IVH8w7/Zav62nY376dJzRTihySZtZ
	xx6whND5wBIBvgto3K5xM8n26/ekQv
X-Received: by 2002:a05:690e:43cf:b0:67c:2ae8:dc65 with SMTP id
 956f58d0204a3-67df44e4e20mr1607796d50.46.1795287541934; Sat, 21 Nov 2026
 10:59:01 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121001550.732679-1-ralerrdirsardx@gmail.com> <179522024822.3294.17329682912331634453@kernel.org>
In-Reply-To: <179522024822.3294.17329682912331634453@kernel.org>
From: Artemii Mashanov <ralerrdirsardx@gmail.com>
Date: Sat, 21 Nov 2026 21:58:50 +0300
X-Gm-Features: Aa3M54rHJ66VyKfE32a-FeaNuXqo7nqps2L47RZ7BtP6YaBp4jMQbNn_NZfmEeA
Message-ID: <CAGHp__ZAQwoaA+1m-YTDVnvHyfZMPpKOvbbge_gY06C8QT_zPw@mail.gmail.com>
Subject: Re: [PATCH net] net: bcmgenet: reject undersized RX classification
 rule buffers
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Nicolai Buchwitz <nb@tipi-net.de>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

A scripted source audit of `ETHTOOL_GRXCLSRLALL` handlers flagged this
path. Reviewing `bcmgenet_get_rxnfc()` showed that it stops copying
rule locations when the caller's buffer fills, then returns success
with a partial list.

The original behavior was identified by source inspection. The
ASan/UBSan tests exercised the patched handler in a standalone
userspace harness. They verified that an undersized buffer returns
`-EMSGSIZE` and that a successful call reports the actual number of
locations copied.

An earlier revision built as `genet.ko` against Linux 7.4-rc2. I did
not reproduce the issue through the ioctl on a running kernel or test
the patch on GENET hardware.

Thanks,
Artemii

=D1=81=D0=B1, 21 =D0=BD=D0=BE=D1=8F=D0=B1. 2026=E2=80=AF=D0=B3. =D0=B2 03:1=
7, <netdev-bot+sinfo@kernel.org>:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by LLM and not proven at runtime). If it was triggered
>    please include the symptoms, like the stack trace or kernel messages.
>
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
>
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> --
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
