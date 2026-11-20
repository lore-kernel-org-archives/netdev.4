Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795165729;
	b=hM5phMAuSqDtzoJY1gSOi3OqymNs1+6ASYrhsG+Mlou69V2JwABqyXftZc0zPEesOlX3
	 GggudHgSuEP1V13qWeuCaJmJprUIlB4sGYoBoZq9nftwMKC3pOr0e1hQfieaL+fmUEv4r
	 Pjh8N+koQ7vlZGEFEnmrHr0M4V+XG7sH6GWSYS7CjFXD+JRLMmY8NGXdNJifOrZWndYZi
	 SXyJkQQ5f3rWRNEuECpJj8AmZyFl9H0bs1c7maINN9zrm8BY8+//AogyWtpE2WVVWe0nv
	 80YxBPqNwJROpD/bfUNfOIV+Pc8NRTorbCLNEXXj48/dfygxSIvfwR6CQXI6XxL49cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795165729;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:From:To:Cc:References:Autocrypt:Organization:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=6PXbXU0ka3epgNJUDE2l0N6gc+yYvl4PlstUHthWBu0=;
	b=FDZpyU0JyNZOUCO5M/d/CHnIPlU0pg8gqQsuOULAeeyEXOa5w0dLljwGPNbRWnJW+VLz
	 Eh1ip0FcaJuNYrACVH7NtzzqI3OZCN7fEHrA5ojdOm/xfoe6/Vrw1jbn6hbPLtAIBCM2y
	 +PHmxBwLt5gHhg8JfsBwbOJQO7jU5rhYNi0yyT4AXQnG81eyhayUInF/RHmZ4bQby3FOW
	 VqLoMqsgn8Xw60qnf8NJiExqeXgVoCC8R+lksCBliYJ+0b/oRvvEbcM9a3XODpK7kAx1o
	 CE0ThVk2Bp/7xRDFKfdABVAZCVlPZ8nMNoczwv63NMDj5to5SjoMnjKrq3OqFcxRK8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VjAsJkuV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7294606A320
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 09:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VjAsJkuV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43F9D1F000C4;
	Fri, 20 Nov 2026 09:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795165729;
	bh=6PXbXU0ka3epgNJUDE2l0N6gc+yYvl4PlstUHthWBu0=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=VjAsJkuVtOlizVxwV7WLYnSocJhXnI9I29ebjM/gJnsPj68CYNfD0O1zcQF5Aan6U
	 FsJy/80t/yEor2jlWhfS9+ozAuqv4vhb21fM2WsnLdE88TUfA10ctyHGhLmoa1DSIL
	 eAzMyuMBGaWRG3t5vGWw4fSuRlVf9KihUYpI2PIQrHbcEvx6X7+hQEV3ztP6/oZ+zt
	 MoU1I2k2z5iTyJh8cPwvAKSsj6cs2jUrfZc6RKL37Q06tK1iWtWd1a/BGrpqy2Zpz/
	 Dn5xB8XzcZHGbUsAGDIy5yOVcE3lKgvtDVBEQaZJB144c1OWut6PK3fik8rwWsvn3E
	 5RPnXsGMNARSg==
Message-ID: <0469d224-3baa-48c2-9d28-ac0d9fa2ec73@kernel.org>
Date: Fri, 20 Nov 2026 10:08:45 +0100
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
Subject: Re: [TEST] Google's Netdev-CI: missing results
Content-Language: fr
From: Matthieu Baerts <matttbe@kernel.org>
To: Sheena Mohan <sheenamo@google.com>
Cc: Netdev <netdev@vger.kernel.org>, Willem de Bruijn <willemb@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Pin-yen Lin <treapking@google.com>
References: <26fb4276-5615-45fb-9cb9-fa5e872d8e7b@kernel.org>
Autocrypt: addr=matttbe@kernel.org; keydata=
 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
 lzVbFe7fduHbABmYz9cefQpO7wDE/Q==
Organization: NGI0 Core
In-Reply-To: <26fb4276-5615-45fb-9cb9-fa5e872d8e7b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sheena,

(+ cc Pin-yen)

On 23/10/2026 17:52, Matthieu Baerts wrote:
> I'm working on the Netdev CI, and I notice that the runners on Google
> side are frequently missing results:
> 
> https://netdev.bots.linux.dev/flakes.html?tn-needle=google.*vlan-py&min-flip=0&br-pfx=net-next-hw
> 
> (Look at the non-coloured blocks.)
> 
> Is it normal? Do you mind looking at that please? :)
> 
> Note that when an active runner doesn't process a branch, we cannot mark
> the whole batch being validated as "not causing regression" because it
> is lacking some validations. So when this happens, the end result is
> marked as "pending". That's not an issue when it is once in a while, but
> here, it looks "too frequent" not to be reported.

Lately, it looks like the situation got worst: 3 days without results.
Because it is blocking all the other HW tests, I temporarily disabled
the two Google runners: results (if any) are still fetched, but ignored.

Do you mind improving the situation, please?

Cheers,
Matt
