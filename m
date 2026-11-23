Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795455429;
	b=If//MHRRk/Jx/g06WRm5L4/PjWljeQwyfWjJjkaatZBW2BJ5Gd1Tj/5tIFX26v864HaQ
	 GB4jvKUDmG2VDQXb+IgAAUPOmonoCfGN0+snHSs4TVvjaMyPSMFiEv5XrmtllrAQmI0tj
	 DT2gY6OhXUlnrobtyVKuRX1t+feEr8VtgF9JZkzBKSLCrHibXIU6WHcmz6oYv6bO5SuvK
	 rIoTjB2kFEysL6xbugA8n1hu7r4ucmV2b/Ui0/zKRxquUI/GETbdDR3E+sRxqlFS2sMYE
	 H0DNT+By8pTT2RQR0jl0o+1YJ7qomHheHduQV7iHOaeqNKOo1rsgqZaxjR0CyEJ/ufw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455429;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:From:To:Cc:References:Autocrypt:Organization:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=rzVynzPII4AN7uXHnRqc3zCQk4r/0ZARldkXe2YrPVk=;
	b=DPOsYfkQeIwt8yzBFE7ZEDc1wSlvN2eyTKxx+W7IBtlErgdJqacuPG3Wv/0goWKrT/sn
	 V6Jl9OMXAUch11xXQ498xNdQd+Bt0qxpoigrbWBdxtTl7IKDURfElew4kqBCrkyLgV4sC
	 t7FRVZ1C8BlbmExaRX0/a5N4fbitnrfGiRGFRB8vhN7Fm7Ob4M1hZBXAuL5r4t9CqPlkN
	 cFiG2Ivp/pbmeReEbjux8QEUWrOaSSmxpKE2A11QKBIjpetNqLhk7r74PZYsoAUgL47NJ
	 zMta5HnpaEciqSyP+vXFcfIiWx2GhHdshACbbdE4WffvQfaiF7zIbHHSJZ38wvqit9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IH8KuXr0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A83606A680
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 17:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IH8KuXr0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5DF51F000C6;
	Mon, 23 Nov 2026 17:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795455428;
	bh=rzVynzPII4AN7uXHnRqc3zCQk4r/0ZARldkXe2YrPVk=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=IH8KuXr05CpSwqZDlKdf3+4E4eFKAi3bpYR8lG6xwqGS0m00C5hcsjE0OVzM5nU2q
	 dWsCLL7Cls6atXJvp/6SG/QG0F45UwWjQ5tsB3FsJvHBpo+tsii1T8zOjeuiiesPkv
	 kFlC7pCWsaHuQSYHugUM3aRxGF1xlMLI4MXfTeXG0S66Y0Br55WmxNdmG8nJXA8jci
	 yl4pTRsaSMxB9/ec/JJaDXcq7sRws0hqiDCjih2Mx3tmmlwF6kRV4hy/vNhGEJCZid
	 SgBatLcl1Y6Xe36BHtoSSjIAOJ3IS6V41IwDhcfmLBKJHB+Tii5U4RRMmKCSltqpgq
	 khfn/A4iWsr3g==
Message-ID: <d08b597d-f5f7-4487-9c0f-93eca264fad4@kernel.org>
Date: Mon, 23 Nov 2026 18:37:05 +0100
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [TEST] Google's Netdev-CI: a few flaky tests
Content-Language: fr
From: Matthieu Baerts <matttbe@kernel.org>
To: Pin-yen Lin <treapking@google.com>
Cc: Sheena Mohan <sheenamo@google.com>, Willem de Bruijn
 <willemb@google.com>, Netdev <netdev@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>
References: <224334a7-150e-4794-af72-596c3821558c@kernel.org>
 <CADWJPTundpvzkpJrxva=M+6YF4zQ9dRSY78Xypi9B1NuH58Usw@mail.gmail.com>
 <a9e4655a-0a12-4b40-9641-36e7acc2cdcd@kernel.org>
 <CAHwYsiqOhntJR7D00vzRed1=eo+4xXnRdYtTD79zdL35RT9Kog@mail.gmail.com>
 <8093f0a0-3a87-4cd6-9c53-e575007a9762@kernel.org>
Autocrypt: addr=matttbe@kernel.org; keydata=
 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
 lzVbFe7fduHbABmYz9cefQpO7wDE/Q==
Organization: NGI0 Core
In-Reply-To: <8093f0a0-3a87-4cd6-9c53-e575007a9762@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Pin-yen,

On 20/11/2026 10:09, Matthieu Baerts wrote:
> Hi Pin-yen,
> 
> Thank you for this email.
> 
> On 20/11/2026 04:12, Pin-yen Lin wrote:
>> On Mon, Oct 26, 2026 at 9:41 AM Matthieu Baerts <matttbe@kernel.org> wrote:
>>> On 24/10/2026 19:49, Sheena Mohan wrote:
> 
> (...)
> 
>>>>       - napi-id-py & bond-options-sh: We will investigate both tests.
>>>
>>> When fixes are applied or unstable tests are blocked on your side, do
>>> you mind pinging me so I can remove them from this ignore list, please?
>>>
>>>   https://netdev.bots.linux.dev/contest/filters-hw.json
>>
>> Both napi-id-py and devmem-py should be fixed now given that [1] has
>> been accepted and merged to net-next. Could you remove these two from
>> the ignore list?
> 
> Thank you for the fix and the ping, I just removed these two tests, plus
> psp-py for IDPF which seems to have been disabled on your side.

I forgot to say that I also added testEthtool for IDPF to
filters-hw.json because it started to fail recently:


https://netdev.bots.linux.dev/flakes.html?tn-needle=testEthtool&br-pfx=net-next-hw&ld-remote=google-idpf

Is it something you can fix or disable as well? :)

Cheers,
Matt
-- 
Sponsored by the NGI0 Core fund.

