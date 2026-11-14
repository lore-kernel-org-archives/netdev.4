Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794674999;
	b=JlV3gNi+CADaHCiNUc3CmRWg2jQ7arMDh3s9Ylsz2srUqnQiCHYSVPLLI3ziQ+O9/WVK
	 uz6VGwQ79sIYMhMdIeo7LA0KktJEMbaWvfl7YMUR7ns8K6yJsmM12Z3IJIPzdN7sVlE0d
	 5H3XzM9oay3CH1VOPFDKrTPD+yMmeQEaugIDvhQjstewJz0ntvtN2CUm8HD1HmHlvziUP
	 rMSxUK5Zsg3YTcukMi27rwY6c3mSoo8mFoCg6pm4UeymDxT7REG7FzEKQsumGjVtt/moX
	 QtUzClPOJ3Tclg0u5gLFutnRjJ50Pu4QFdpOQHyVxuztFjvyvCYNcjj2oEZ6AdwgW2g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794674999;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GUFPtUc78Ff2nzctbKPfIz/d8+p1b1chHezhK1s1XBg=;
	b=4PSVFi4j5cyy4ct5AX1JMwxkq3kvEZM63OLc06xyvO92ZaCzBi0NlyGaC/5y1PVhhqj8
	 AEd5xGHJUSvjNM1W5w2tv+uh97P/JI7wNK4oadAdncMEn949CIYbLX5NnnYP5Sf4t1yxO
	 PZYlTwBOsqFy5LBWmOnv2wzK1QEb5Wn7IsiscLveTOOX0Chlswiu0rhN5eBJqel9WDw3/
	 JTocR+YgmS3Q/Ryijy6KO7eY8anqt9ySNomLk3IHiHv/viQE7ojPn85KCzuQaMro6WwVv
	 jyicfd5f8+yv5HtcyqE99msFEqroPwF3k3J/b0xqIF1xwOxyD44mlcNjZVZCONCcGKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QT1ksmBZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560B0606A327
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 16:49:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 560B0606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QT1ksmBZ
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1aefd1bf74aso1520593c88.1
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 08:49:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794674998; cv=none;
        d=google.com; s=arc-20260327;
        b=KVmAFPD6DXlfu9ChdB+ueN+n+Sro0puVofmzXoXKjiw/9+BRSSWo+fnSEorFnDpNiZ
         E9bMwOwNB78n/TXBKO0ru0afv6LznxAdiystHf1l2HIeM8cYEZQ6S5r8rw+rWCUVha72
         gvGjsWMZtQ74JSaRUYYUA4PX18B136h+9XnmmI7JTHpTGalI3nIUoUxYpVw+dYUKEaDN
         9U9/6qlpehBKVXmO6h9nr6Q2tqvIySkFMm5x9E0tQL3SMuc5PvkZRo8zaK0t1eqy+urN
         sv3nmkx27vGvF+aZ7rPQK+pUJtfumCqYbhMcFw0RHmbBiKCmomcyEi8fHgcSuJ319D5M
         0xgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GUFPtUc78Ff2nzctbKPfIz/d8+p1b1chHezhK1s1XBg=;
        fh=Oe+euBF3qYylcxmd2txbAbqmipjc1z8GFdd3oYVevt8=;
        b=bJKrmBUyg5EDA4iHJDNZgW75ApkiXlRZhFxp7MpQjTdG6Xc/MnekQHQJbhIsRfqhmb
         zVPAQZLnrZ1wBpzAMEsjGPhxtNdwGnLhPjRj8gz/2qIlT8c+r38uU4dIr2I4OXbYxfA6
         8Q+HvjMLEjHwraauA9ya5g/XmetcGDiPvCgZhf1LyEGLd8a+15tHkaCvLHjpjGJlYxqZ
         rlOf29R+JS95L9TIE9F4q+R/vif1a2mx1iTnm0ACc2ywmCySRxNv0y+/foiLowgNqhej
         c2mPbA0qApU3dqsh9dECQ09odITPvLs42DlLCGXTJ7oATAFYp4Wb+EdnE/ju7jogkh8Z
         ZBlw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794674998; x=1795279798; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GUFPtUc78Ff2nzctbKPfIz/d8+p1b1chHezhK1s1XBg=;
        b=QT1ksmBZYJTHxX9VIlJwOkYoAstbMSNvCaFil6h6hB7coI8Hw0/trYb8/BMFP8L3fX
         VQ0d4Q5KMWznywYHFZYnXNMwytK/r7aSnoBfBAdgPTXmUg3decfIcPro1HNYaTmxGDfQ
         XH4FayJY8UfjC2uS1WGGz3AqQcrezsGeq/dq48l/RA/ITDWvOiKJU1CmXJ9fKeaieLOk
         8NdEcmr9lMQCGiFdEAdk4vxnGuGB5epLM8Xx03pOaJBMTvLnPmle54txUURtXFHl3juz
         61QIeBAEt2A22ZWotJwrWFktgzUwDphy1KtsGoj/B87AAJKWW8EL647xaEu5Ps1++/N/
         W/Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794674998; x=1795279798;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GUFPtUc78Ff2nzctbKPfIz/d8+p1b1chHezhK1s1XBg=;
        b=XOUJYLJBxR/ys2ZqBZ7aYRnCyumMzHhOAYk+LWnpvGnaftt/n5pkVc+IiwDY5QO4R9
         VTFIlDuEqW2AiGydWPu+NAgfBgopTXpDoXWUq0hKvP8JRrn0WW6zeoxHK1tagToWOm41
         Mk0WZM0J1iVV3m19o/GnHa1XLhoxAyHOtPurqN5Qq4ku7CxxjNvdZt08KDU2QoA6YncJ
         OVo7t8kq0sdomzX0hqxYcJgwSeJaimKkkVmNuIZQsrzArAOpkS8v2fhlydz86IpqzW6A
         wkqqHJaehPru8hBeybkC3wkHTQLPFuxCp8BZ9Yp8XHX/wlou7uhVJ40d3qxisN12Qz9+
         9NKA==
X-Forwarded-Encrypted: i=1; AL+hErEz4P9ZP6lMWpMZ4U6vrK3cSYulFhlHozJ/ti4Hn+ezLtXBhGHNIzABDYqAzsUXArKOGH59t9E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GU9uWS/ehbUaVapwlpwFdWbhWH+m3o+8y/Gi0dSmM41HDZSG+
	Q+RLD/KaYfHSfA1F1Y3DDqpjvs0U5uAK1zzjUqt6zXdBro6T9ktKMPMDB51y8DQLq582lfZ+8ih
	oJL0Hd3+3XGEKBBXxZqxIu81TPZkPod0o4sGbaJFj
X-Gm-Gg: AYBFou0TlAhgDSglNRDv8b0ILXht6X1EUzmpBfWxw0wWMugBa0pjaeFM9JAH9hBEW8e
	kmGxT6+qo76rlkQxBfusk14BGjToMnWyIaJrU+pYfBbP6cIhlaoJtRCnvpbimnMCqJoC0a1IYdj
	uMDMNdc+CiGIbGqcRmBvEOTcSc/QR6G1kRLGZPaSaq/XHT1xl/Pr1mXsCYVFCOlulLa4bwt92zT
	TAVC2H+2LmOqh8slB+9MVFsRI0vT3MUXWr2Kw1+flLOag0dWbUuFSQSJyDhUFg1Pun+oo2q1nI0
	OQwlE/r5iKFDNarZyVlaR1K8Hj+4N/xNOH5WmecU8jly2F/RfFrsvnlWeqULSGKoJvhyLTt8sOO
	Ln/06Am7Su1gDw6KcBLHXaq2g0HWZuJGnzvNN0XkyKEsblx8VdwNyhCja8lQJ1AFpUw50YiLeuF
	rBohqCCZ5SZVv3rA7HhGLznFTpEL7gsKN29wFvuWjnCXxfLwNfQK2OJpQ2IUxEn08IL89y3q2u4
	pGqqWhOSQ==
X-Received: by 2002:a05:7022:3c0f:b0:143:808b:b178 with SMTP id
 a92af1059eb24-1b4f5f93ca2mr6484146c88.26.1794674997531; Sat, 14 Nov 2026
 08:49:57 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114162632.16346-1-sidchintamaneni@gmail.com> <20261114162632.16346-3-sidchintamaneni@gmail.com>
In-Reply-To: <20261114162632.16346-3-sidchintamaneni@gmail.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Sat, 14 Nov 2026 08:49:45 -0800
X-Gm-Features: AclHuK8e2NpHhPJrGzHc56g3dEpZLqRfkrJ7tU89mCr43OpsTZY4kmX_0Ds9uN4
Message-ID: <CAAVpQUBxBDe6kwE_0nKcjnNyfH8_DgYXC99xP5-UATpGn36Vhw@mail.gmail.com>
Subject: Re: [PATCH net v3 2/2] selftest: af_unix: Test scm_fds on dgram disconnect.
To: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Kirill Tkhai <tkhai@ya.ru>, apais@microsoft.com, 
	hargar@linux.microsoft.com, rlmenge@gmail.com, egoriluk@gmail.com, 
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 8:26=E2=80=AFAM Siddharth Chintamaneni
<sidchintamaneni@gmail.com> wrote:
>
> Add dgram_disconnect_fdinfo in scm_rights.c verifying that scm_fds in
> /proc/self/fdinfo/<fd> returns to 0 when a connected SOCK_DGRAM socket
> with queued SCM_RIGHTS datagrams disconnects via connect(AF_UNSPEC) or
> observes a dead peer in send().
>
> Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
