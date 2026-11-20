Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795165791;
	b=a3VIXs8XheD8XacJigjnaYTUgrrgiDE0l1/POe88I8eN1Fxki9o1x6f4T9OIEqAYo/3/
	 1+iBt4XpPlElc1ioi2BSahroZoVplLTcuX7dEgYUgwjMYO5gHk8ieC+mQ7aQtW0y3mimV
	 Icl+8z3IR/PaLMhezHmkd38d4Va306XLNPCSaQ+dAQDvvdfhAC3Ewf7k6h+SJClUqaaXM
	 3aQtGUG0XT1VtsEUp4WrgihNmgsSX/KgwUmdVY7tNdZPq4I/xbwoGIerP1Pv0G8675+EU
	 gwMnapGakCmD4SGrMamgYmpP/Yg/G2Ec4x8ULDrUnNX9SAemZm/F6fCOFhzzRLxbNOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795165791;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:Autocrypt:Organization:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=CmJfn24w4nWa5aEbsQ71x7lCN0xNaoRjheeUWow+eSQ=;
	b=zCPpA5mNL4WfGiZp9G2P3Gz3nnnGGctsyWHoJZdXJmjHSes0a81jSgqlhba3/jkCQgxu
	 PGhXzH6LMBwnFn/p96smqE8/YQ5bB1Vp/n6I/wy6idDQu2hoXFXdJj0S+HZhN13wvuRwf
	 ph6GE0FBMZa5zKH/WqGWFYLWknSx/NFawu/tdAUY2qqZPMD+cu1QiOUpkXi07wPSsxKcW
	 uVgB2L05lRflZbZfu1im3nMySt3vUuE+5pH+Ys19c2ePovk1so6383rhEOZQoh4cbfcWq
	 mTJrbu+VZI9q/K1XY/4HF35ihTbsARHdpEYU80WZ72AAdWAtCjlfqKq7sndNaQnOQiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H0JPP9dk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C387606A320
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 09:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H0JPP9dk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 910341F000C4;
	Fri, 20 Nov 2026 09:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795165790;
	bh=CmJfn24w4nWa5aEbsQ71x7lCN0xNaoRjheeUWow+eSQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=H0JPP9dkRORh9J+jSdChvaBtZmg6lvG8XWN1tb5itwlRDZd80p3CIL2gYWeZMDZb+
	 N6a3J9YLpbKn75u5DwfJsgI8biAYKTIpTiGTlSCt/Mn0YpfZGB5KbnNaUBjyvYsNog
	 8dMUdfZIvCkAnrN41LVPZOZ2YqRCHoPTdcci4DC8lMxvwP2ZQkdilf66Q0f4UGbcJm
	 gICOS2sTbrE6sC07D/XbUO8HGGkZ69ORJdTpjxkmWwzLshZj1PrwR+I595juwIVGGh
	 VdfOiZYsqANsDxo8N/RzG2DDIN7JJkineB8Ex2yvg00s+jWKARwEpLGjMHyTqXlRkd
	 /25+4JL5pEN+w==
Message-ID: <8093f0a0-3a87-4cd6-9c53-e575007a9762@kernel.org>
Date: Fri, 20 Nov 2026 10:09:46 +0100
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
To: Pin-yen Lin <treapking@google.com>
Cc: Sheena Mohan <sheenamo@google.com>, Willem de Bruijn
 <willemb@google.com>, Netdev <netdev@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>
References: <224334a7-150e-4794-af72-596c3821558c@kernel.org>
 <CADWJPTundpvzkpJrxva=M+6YF4zQ9dRSY78Xypi9B1NuH58Usw@mail.gmail.com>
 <a9e4655a-0a12-4b40-9641-36e7acc2cdcd@kernel.org>
 <CAHwYsiqOhntJR7D00vzRed1=eo+4xXnRdYtTD79zdL35RT9Kog@mail.gmail.com>
From: Matthieu Baerts <matttbe@kernel.org>
Autocrypt: addr=matttbe@kernel.org; keydata=
 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
 lzVbFe7fduHbABmYz9cefQpO7wDE/Q==
Organization: NGI0 Core
In-Reply-To: <CAHwYsiqOhntJR7D00vzRed1=eo+4xXnRdYtTD79zdL35RT9Kog@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Pin-yen,

Thank you for this email.

On 20/11/2026 04:12, Pin-yen Lin wrote:
> On Mon, Oct 26, 2026 at 9:41 AM Matthieu Baerts <matttbe@kernel.org> wrote:
>> On 24/10/2026 19:49, Sheena Mohan wrote:

(...)

>>>       - napi-id-py & bond-options-sh: We will investigate both tests.
>>
>> When fixes are applied or unstable tests are blocked on your side, do
>> you mind pinging me so I can remove them from this ignore list, please?
>>
>>   https://netdev.bots.linux.dev/contest/filters-hw.json
> 
> Both napi-id-py and devmem-py should be fixed now given that [1] has
> been accepted and merged to net-next. Could you remove these two from
> the ignore list?

Thank you for the fix and the ping, I just removed these two tests, plus
psp-py for IDPF which seems to have been disabled on your side.

> The fix for bond-options-sh has been sent out as [2] and the
> discussions are still ongoing on the mailing list.

That's good, and the v1 already seems to help. Please ping me when the
new version is applied.

(Note: as mentioned on [1], the Google runners are currently disabled.)

[1] https://lore.kernel.org/0469d224-3baa-48c2-9d28-ac0d9fa2ec73@kernel.org

Cheers,
Matt
