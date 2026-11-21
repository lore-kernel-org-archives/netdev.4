Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795294622;
	b=m/7sLgYDfYaeKgdVwLkjN2WhB22vEAOQm7oGJUub10uH9pNS5Eyb5oxugZ+/dIiQUWLg
	 f6uZTnJU/7CEjru79WheIcmm0yzS8n+7KzadE1HLLR5tGA8uaK8D/4nTpDsFwgJizOMq+
	 YA1lhV03fRDFjjqnHwn/SP7ka3KMFthEJ0payZLdxxDtv8UDjbMuOXUGAgrTQTw9qMFvm
	 yXsh0zxAjQPYgkkgglodzV06gBxtLTLidJpWwZme+GxxxtO+a+syN1zErZumVH2TTCdjZ
	 QWy/0xvjtWYZnziSycet2iwPMjCKbSZIO3Q6ku6cWFQWrQsPpRX+kI7YrdUpID3xWtg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795294622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=+f7+ztUOyhaovcSK8/cLlVw1Izw6zMt7sIYYHaQmuRQ=;
	b=q+9la6NtcVzgDxtLJPU8fWBcQIwbOezSs+FGsRk++c8V5MSIh1XDLaHIgf4Tn6CpB+mn
	 gm5uZS3Gn6224JKOz8ssP+/S7crb5uy1NYqLrGgPk54FsUSx4hFV+x5xFhSlcL2Db834T
	 nISgmU8Kw20sq3I8x57LNtGMEE68JlMZxDwOHc5TWfoPrnLkVUjReFSb8CU6hhI5vCQ2Y
	 uwMQp/OQZHSzPJ7oyxQYQbOvaqqYCQiwsy/9TcSbVXlbR2Fy0uRihwuI8+3onpH1Uqk4o
	 u5OH5Po+sMd5orTjTbI4bxRX+3xkY86TIOvD8VOgta/9EbcH60GkqZg06a3A5pd8XRg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L8TpTXAE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700BB606A330
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 20:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 700BB606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L8TpTXAE
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-679aeeddc6bso1917223d50.2
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 12:57:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795294621; cv=none;
        d=google.com; s=arc-20260327;
        b=ca8xywQGX16vuXWKXhGsW/71UADqT8cCrwoN2yqeT6yyrg8CaMYHuO49rx0P8Q/u09
         rv7R4jDv2zD6hXWPP3KGv6+NXg/7zLaTnvlScn8ymMBekPsnR6x/F2hrJeTjcPDzJEu9
         f1ztS59SC1A2t8OccDJGCjIUZbBkmJtIMinvasxDke1COccL6K4SDCHAIdhJcAY1VTqx
         CY7c4kWixazr7a0eII103zmjyCoXPyybZp0yOIQSalBYGlOofrRl9aPmJILJnVMVUG8E
         nBPs4YatdaF1WE26Bslj+XZPUsPgeQFL0C6JX1oOaedLkpt/1Us3/HEUXEbVkjO76KN1
         YgSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+f7+ztUOyhaovcSK8/cLlVw1Izw6zMt7sIYYHaQmuRQ=;
        fh=xu7u2sA8t8EJVsJsZkN/9gLfmqBhLzBy6XmzLAKjTv4=;
        b=QU5XeYo9GSHyxt6XG71em+w58n1nt2Z1ti844aRkYRCNrz+3ch8mC0mqNZWKwff5v0
         5PcnzZ2/9KzQNDoIpVN4oyn9xfQ8NJso1P7medupSy/2kDpsGRarbt7aQ61MxDP7kKfY
         kYsaxJX5gZKU7AlV8+/5EsZ0FDohwPYWIpokUs3O/OBLglZT2PkslK3WYqud3knPzYka
         BbXHnnbIGr2Pyy+JZnjO83uM9UnfiEQtBV/UaI1k47zbUcKUFtl/0gt5Ztg30JL7x5P5
         8VT0HoA59bNtTz48aRhpjz2yQ7GXcjCorGkutfE9NUw1KNoGTOx35uK19wkPFVEC6c75
         M/BQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795294621; x=1795899421; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+f7+ztUOyhaovcSK8/cLlVw1Izw6zMt7sIYYHaQmuRQ=;
        b=L8TpTXAEpiXgcy2GKVxQnFmBuJH6vl2ptnjqIEIRtCqzlUq1sVsLGGfoaV5bjJA7vt
         QA0lladoUwfZ90X//yMghSakFBIWC6KSCxJmehuZNTSpGV26w/lkvLis7LrBdN9X/ORd
         o/951mpQU/H7ATA+4LnTTK2TEOrI8WYLlMhChTjwLOxL8mxy85MwoLjEUTyHNLCxjdQm
         q1IlBMp4fSotbhCPl/XK2Cus/GMm/nrzzRxjLKU3+wyum+hSnGEqxWVPoNsMyxtiKUiH
         BsPV82qfwYn55bVTvSQSgjvRC7qFFcltwpI9n0dq1dhOffwHFu1bJHpa/Stszx49sJiD
         MgIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795294621; x=1795899421;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+f7+ztUOyhaovcSK8/cLlVw1Izw6zMt7sIYYHaQmuRQ=;
        b=x7sYcGcndni43ljviI4ClKN4XYQe+NMsAbbUQSGKHNiET/lsWHKnJ/9gsM0zt63Glk
         NWi9oIZQ63PLHQu+qxz/WCspz+q0Uxhr5gTHkF0/f9lcgwU5r+x0oy7qLZfdO/YAoy0P
         1IA1OLFyJNl/4lKSBXZKVXKOO6X2PdB4pE0VwK8KII7t15FsaORcFhevK+LPg+sEs5+d
         RiCPKHUvdD5FgjKDiarPWXTguozenoJZUm4k5LLY045v3MNHpFNP5X6uJ6aEu2bf6quC
         yAHqPXdJxwYrgFSh3moOhKbuNda3BuFIC8w2VTj2QihVJtNWaSCbM0wTr1bA2zqqTN6J
         08fw==
X-Gm-Message-State: APuU4Z+1YeRvaNVwwrX2O5wKKE/7VhyUtQg2fhJrw4UL2rF9ng3DRm9X
	zV48vXMeHxN3v4EZcbJZ4HMYh7x3Lpi8WXQ02PtkWZ2ZSsMJw5b2+BPIy177oo1YSoc9vIKnVB1
	YIXLddbqnVCpAzYN9DDKW5hWF0ATuOik=
X-Gm-Gg: AZFdTZd2/KAKjH3ssSsiG5ugbBR2joaPOb2s84q5wclKbM6BsCzrP5Tj8ywxbllm+D2
	MqFZlYfIrJEQM4Q9K5s0RmyhFF0PaqNDNlmrv8nxUGz8hmk4Da6FxXCMNMfisCLyzNUmHBqH3Dj
	KPbwhxmeyTCL0cGWVTEErW2U/1M453axkrM5MmLW4YBGUd/KU+nQ/ZqZigHjpMHJcg8iOoSeBVT
	ohUddsvkomEliG7Bv32P6tAwTW3z32qC5igaHNWflhGi+BULly+Gk8Z2z9ZQsOw/gpxYaY5GRvM
	pYehXdKVTjpWX/5xIYbIaUk9Z9qrKa2f9rGGDZ65FVHkDLt0anhIP25dWISMBLvPjyxsG4qHs36
	d1DpIWrUzzOxIAR09em6NC18Kiv2WpATyh0giZ22CowOaA9oL450R+kjZZ/KfcDXoxt92ICP9Ti
	TYPyKG0qmKP3M3TWNtHXRNbqQH8s7v
X-Received: by 2002:a05:690e:47c9:20b0:67c:6e6b:2b58 with SMTP id
 956f58d0204a3-67df442352cmr1473959d50.29.1795294621418; Sat, 21 Nov 2026
 12:57:01 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121001414.724236-1-ralerrdirsardx@gmail.com> <179522023307.3294.6067722832080574797@kernel.org>
In-Reply-To: <179522023307.3294.6067722832080574797@kernel.org>
From: Artemii Mashanov <ralerrdirsardx@gmail.com>
Date: Sat, 21 Nov 2026 23:56:50 +0300
X-Gm-Features: Aa3M54rI9vOhz5FwN5wgejilnXxYc_imK086uF8S01hpRCkqWw3qDXtfbHw3p0s
Message-ID: <CAGHp__ZrFmXW82R9hpyzRGL0ORdFF=Q-yvcNMFELRyHrfJMzJw@mail.gmail.com>
Subject: Re: [PATCH net] net: mlx4_en: report the actual RX classification
 rule count
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, Tariq Toukan <tariqt@nvidia.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	linux-rdma@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I found this while auditing ETHTOOL_GRXCLSRLALL handlers. Reading
mlx4_en_get_rxnfc() showed that the original loop used rule_cnt
as its stopping condition and could return success without
reporting how many rule locations it had copied.

The ioctl behavior described in the commit message was inferred
from the original code. I did not reproduce it through an ioctl
on a running kernel. I tested the patched handler in a standalone
harness with ASan and UBSan, checking the returned rule count and
the -EMSGSIZE return when the buffer was too small.

An earlier revision also built as mlx4_en.ko against Linux
7.4-rc2. I did not test the change on real mlx4 hardware.

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
