Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425662;
	b=CFsYh+kWw7gwexoUATI2UpuQ79d6uovLRmaq2DePxVPrviBPqdfMViei4BJZkn1Hym5T
	 9L+K2Fy3svXT1ubJvK3Si/jqGgyN9Gi8PvQEbgIRxg91Jh6g0AFmVI7eEdg0ye/IN2ij8
	 +6UnXqN8UfA5idkbnYJ7oqBMAJiZFkKuGPVEHup67EAbIgicNJyKVE/23bAUXeOdSbKL+
	 u6y9UfTxBXK1b3+DPb2dPUoNj7niLzF2qddFa9pbxMqeTVVI844+GzWlwUSA9kYK7Lf9k
	 bq++tabL0XM5IL+6R7g9eM2LqsTrgUY7Rmw5wjzBFcPfrWOH+eKQk46OLqJhMBVkJcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425662;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:Autocrypt:Organization:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=+Mxn66E+3S6L9J4jlnRsbyid0B8ipZGgfWiQ6G8vu0w=;
	b=fE5sAbT+zDWm/vcAowAQ41tDIURL18g4BFLBA6Rx/3N9mjJu2nJE9QDQmFYXXWyY+Aet
	 PyD66nxWmR/J7naJ17jnVlPr8wO4CiTP+ij7CH3zetN+EqvcHgq109CBGqqDKoR1XRtCX
	 f95bLC/O4CHGZv9CY5BvuVhtfvtw9P7NXiTBbEXzNgTKDH0X4iqRGiGDZ68z4XLRzA+z9
	 RKun+kzBMcoF67s8zm1WKFLQaRp0cGf1iWuvoIbwWWmxXNZE0DMX2ezjaUHRh84H6fjvL
	 ZIl1WgHGc3buas4lmnyVoifyDvoyBMsw+tYVdfobObV1F5elwrA86JZQYK3S5avCPXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m17bNl4l;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76708606A32A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 09:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m17bNl4l
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA9351F0093C;
	Mon, 23 Nov 2026 09:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795425661;
	bh=+Mxn66E+3S6L9J4jlnRsbyid0B8ipZGgfWiQ6G8vu0w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=m17bNl4le7rShJ0K9ffxz3RUy7uO7Uf7OeDwO+cTRH+dHKPW0R/SanFpe5V4XrnUf
	 uyCDJ36Yp5K8pPGTzeHLEpHnDitPmoxZV1MeGSIdxsy2ZbaXeRdkepgpiY/FOMT5vh
	 G1RL16P4Gaa2B3qyqnexixEAHinMJLRE/Ay4FhsKzEfYopOi6bP/3uh3mGQCjMFCd3
	 CUuJ6JjESwZVfGKmyDUmPbOSfpF7BCljYKV7Q/hEpcQHgcX89qoaw7m3MnBIfmfsx6
	 AfzcOGTOPXRY3QU4OtTsmYXD+k8yqtq9367BjQZYXDHiC0QnlhFS780TriqINj/KEV
	 nCblFXLsPSceA==
Message-ID: <b3795455-a237-48a0-890e-97165d218260@kernel.org>
Date: Mon, 23 Nov 2026 10:20:58 +0100
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
To: Sheena Mohan <sheenamo@google.com>, Pin-yen Lin <treapking@google.com>
Cc: Netdev <netdev@vger.kernel.org>, Willem de Bruijn <willemb@google.com>,
 Jakub Kicinski <kuba@kernel.org>
References: <26fb4276-5615-45fb-9cb9-fa5e872d8e7b@kernel.org>
 <0469d224-3baa-48c2-9d28-ac0d9fa2ec73@kernel.org>
 <CAHwYsirFS4nAuvXQA-eOgqq8n=29tfvvUvuk2QygrbCt0pcz3w@mail.gmail.com>
 <CADWJPTvhKh9twnA3Hs8w5-yA0uq6wnY=eXANf4hT4jjmVOz1Ag@mail.gmail.com>
From: Matthieu Baerts <matttbe@kernel.org>
Autocrypt: addr=matttbe@kernel.org; keydata=
 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
 lzVbFe7fduHbABmYz9cefQpO7wDE/Q==
Organization: NGI0 Core
In-Reply-To: <CADWJPTvhKh9twnA3Hs8w5-yA0uq6wnY=eXANf4hT4jjmVOz1Ag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Sheena, Pin-yen,

On 21/11/2026 01:50, Sheena Mohan wrote:
> On Fri, Nov 20, 2026 at 2:19 PM Pin-yen Lin <treapking@google.com> wrote:
>>
>> Hi Matthieu,
>>
>> On Fri, Nov 20, 2026 at 1:08 AM Matthieu Baerts <matttbe@kernel.org> wrote:
>>>
>>> Hi Sheena,
>>>
>>> (+ cc Pin-yen)
>>>
>>> On 23/10/2026 17:52, Matthieu Baerts wrote:
>>>> I'm working on the Netdev CI, and I notice that the runners on Google
>>>> side are frequently missing results:
>>>>
>>>> https://netdev.bots.linux.dev/flakes.html?tn-needle=google.*vlan-py&min-flip=0&br-pfx=net-next-hw
>>>>
>>>> (Look at the non-coloured blocks.)
>>>>
>>>> Is it normal? Do you mind looking at that please? :)
>>>>
>>>> Note that when an active runner doesn't process a branch, we cannot mark
>>>> the whole batch being validated as "not causing regression" because it
>>>> is lacking some validations. So when this happens, the end result is
>>>> marked as "pending". That's not an issue when it is once in a while, but
>>>> here, it looks "too frequent" not to be reported.
>>>
>>> Lately, it looks like the situation got worst: 3 days without results.
>>> Because it is blocking all the other HW tests, I temporarily disabled
>>> the two Google runners: results (if any) are still fetched, but ignored.
>>>
>>> Do you mind improving the situation, please?
>>
>> Thanks for looping me in.
>>
>> This was caused by two conflicting patches ([1], [2]) on the mailing
>> list. [2] removed .resizing from struct htable, which [1] references.
>> Our runners currently build from a full distro kernel config (which
>> enables CONFIG_IP_SET), so kernel compilation failed and no test
>> results were uploaded.
>>
>> Results for google-gve are being reported again today now that [2] is
>> no longer in the testing branches. Sorry for the inconvenience and for
>> blocking the other HW tests.
>>
>> We will update our testing infrastructure to use a minimal kernel to
>> avoid unrelated build breakage in the future.
>>
>> [1]: https://lore.kernel.org/all/20261117092731.14656-1-onleaf322@gmail.com/
>> [2]: https://lore.kernel.org/all/20261117101018.523826-1-fuchen.dust@gmail.com/
>>
>> Thanks and regards,
>> Pin-yen
> 
> Thanks Matthieu and Pin-yen. Yes the kernel build failed on the last
> few Google runners. It is fixed, and both GVE and IDPF should report
> results from the most recent run.

Thank you for the fix and explanations!

I only re-enabled GVE, because IDPF is still too unstable:

https://netdev.bots.linux.dev/flakes.html?tn-needle=google-idpf&min-flip=0&br-pfx=net-next-hw

Also, many .py tests (e.g. vlan.py) are no longer tested on IDPF, see
the bottom of the previous link.

Can you look at all that please?

Cheers,
Matt
