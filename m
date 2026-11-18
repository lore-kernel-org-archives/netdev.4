Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=121.127.44.66
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794999740;
	b=ofcQBRNKQh1WUScROLKf5UxF6CP6UujdqXFa5mrhUTvUDVhwEKAGyJjeghQBJp6/WJdG
	 clnDt0zMIp2J7FYUcrqivKJRvx/YLgtFZKf3ZfIj2mgUMgPcXhU9MDo/J4kCrslsnUqLi
	 qtLern+PO5pHeOfsN2AH/hW+c7+Y9aAL7X0wZUHsuPCp4ooUBD5PRPUslJ79PphywUeKp
	 3sWOrvFelOaWB5QgMbTI9EQpzWpLNtNT4utgqrbgBEZjhEYi7fvWXPZL1ClASHIYL7yqw
	 l6khiRwO0SoBXJN/m7G/EFfz3lCuiVygkP449w5h0itiiII54JSWjs+Wg3SFhw5lUFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794999740;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:CFBL-Feedback-ID:
	 CFBL-Address:X-Forward-Email-ID:X-Forward-Email-Sender:
	 X-Forward-Email-Version:X-Forward-Email-Website:X-Complaints-To:
	 X-Report-Abuse:X-Report-Abuse-To:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=AYyEiT8S3iVnRfgJNlwK/BypiZF9VQ1Q93ZoY/Be5lI=;
	b=VF1Sd66z9NV13sKDKKSXb5CQH13TJUaaEjtwkwTklzmfS3w/Pjl5J5j75LJF0lE42+8U
	 WpW2GUi9ZoHa5LjrGJBJawh3ZFqnN96bewy3cWrmRF4o/tCESFizj7sAu3+Psi6QaC+wp
	 ObL5xaqNJcjGr6at9wvCEz030xLSpU82bUpVWu8d/qwMjudOV0mCRQIG+C4mITr6axlRN
	 ij9Bu3ytZnDxXARlTEuGdA2KjEqkgC2pQmm2nreHRgRMz+UlPDa3QAPq9WuQDpBoW+bdO
	 Uj+WdyaoyNens5Lw2M5k6eaC4b0Wqq6JDJvS+6TmTvxB1Ixjq5RLBhfJqVRuYJyzsjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ovn.org;
	spf=pass smtp.mailfrom=fe-bounces.ovn.org;
	dkim=pass header.d=ovn.org header.i=@ovn.org header.a=rsa-sha256 header.s=fe-13eddc7e57 header.b=UMYX4UUS;
	dkim=pass header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=o7ZDb0MV;
	arc=none smtp.remote-ip=121.127.44.66
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC159606A325
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 11:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC159606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ovn.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.ovn.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ovn.org header.i=@ovn.org header.a=rsa-sha256 header.s=fe-13eddc7e57 header.b=UMYX4UUS;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=o7ZDb0MV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ovn.org;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: Autocrypt: From:
 Content-Language: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=fe-13eddc7e57;
 t=1794999732; bh=AYyEiT8S3iVnRfgJNlwK/BypiZF9VQ1Q93ZoY/Be5lI=;
 b=UMYX4UUSoIpmTkATEo7EUrHa1h3KePaEvBzNI9bb7Uq5VmL2qAPWIVsbqfe02wNYtG8me7jOl
 ugI8wnSgCoIkzCeJaIjofwhtRrLrSNWEVzbFN7QbvI1m626qKgEs0NmXjLj3TIqMRAYn8YNto3r
 Li+vgzRFSuEql1pUj2xzUXQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: Autocrypt: From:
 Content-Language: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=default;
 t=1794999732; bh=AYyEiT8S3iVnRfgJNlwK/BypiZF9VQ1Q93ZoY/Be5lI=;
 b=o7ZDb0MV1RtPQGqBw5ZomfA5hZt53f5hjwjYu8YvU5bL7+ZM1RTke5KOZSu8KoBHdzA28NHyv
 KoKj+qLuVsEiOSEcDpFNHCchKLVkUykBaptjdOx9cJMcup9xVz0UYL2D1Hj6iwTY6DUfELZOfoc
 rlH0fRF+EC2veqDZASGHGns=
CFBL-Feedback-ID: 6afd85b11fe8aab4913e0453:7a0c2fbf2d45dc7023dc761c8ba22801
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6afd85b11fe8aab4913e0453
X-Forward-Email-Sender: rfc822; i.maximets@ovn.org, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.19.29
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <9e9396a8-e692-4438-a43e-7803ee2fcfc4@ovn.org>
Date: Wed, 18 Nov 2026 12:02:05 +0100
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: openvswitch: avoid hashing the network
 namespace pointer
To: Eric Dumazet <edumazet@kernel.org>, Zhengchuan Liang <zcliangcn@gmail.com>
Cc: Aaron Conole <aconole@redhat.com>, Eelco Chaudron <echaudro@redhat.com>,
 Ilya Maximets <i.maximets@ovn.org>, "David S . Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 netdev@vger.kernel.org, dev@openvswitch.org, linux-kernel@vger.kernel.org
References: <4e124b37fc972925a825881c50f95eb6b3c2e231.1794989369.git.zcliangcn@gmail.com>
 <CAL4WiirYP1mDaZmyjfqoRJWJLd8PnfW3GFey7tnqYtNNqSn-kw@mail.gmail.com>
Content-Language: en-US
From: Ilya Maximets <i.maximets@ovn.org>
Autocrypt: addr=i.maximets@ovn.org; keydata=
 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
In-Reply-To: <CAL4WiirYP1mDaZmyjfqoRJWJLd8PnfW3GFey7tnqYtNNqSn-kw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/18/26 9:49 AM, Eric Dumazet wrote:
> Le mer. 18 nov. 2026 à 09:40, Zhengchuan Liang <zcliangcn@gmail.com> a écrit :
>>
>> The Open vSwitch vport name table uses the network namespace pointer as
>> the Jenkins hash seed. When an Open vSwitch vport already exists in the
>> attacker's network namespace, unprivileged OVS_VPORT_CMD_GET requests can
>> look up attacker-chosen missing names and time whether those lookups
>> traverse an occupied bucket. Ranking the resulting collision pattern
>> across possible KASLR slides recovers the init_net pointer and thus the
>> kernel text base.
>>
>> Use the namespace cookie instead. It is a stable, unique, non-address
>> identifier that is deliberately exposed to userspace. setup_net() assigns
>> it before per-net initializers run, and it remains unchanged for the
>> namespace lifetime. Fold both halves into the seed so vports in different
>> namespaces retain namespace-dependent bucket placement.
>>
>> Found by AI-assisted code review and reproduced on an unmodified kernel
>> without fault injection. After privileged setup created the resident
>> vport, the timing measurements ran as an unprivileged user with no
>> effective capabilities. With this change, the pointer-derived prediction
>> fails. Existing and missing vport lookups behave as expected. Identically
>> named vports in separate network namespaces remain independent.
>>
>> Fixes: 46df7b814548 ("openvswitch: Add support for network namespaces.")
>> Cc: stable@vger.kernel.org
> 
> Same remark as for your dev_name_hash() patch: local KASLR attacks are
> not a serious concern, a "Cc: stable" tag does not belong in a
> net-next patch.
> 
>> Assisted-by: LLM
>> Signed-off-by: Zhengchuan Liang <zcliangcn@gmail.com>
>> ---
>>  net/openvswitch/vport.c | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/net/openvswitch/vport.c b/net/openvswitch/vport.c
>> index 083f7a8d9d4e..6689c8370ec1 100644
>> --- a/net/openvswitch/vport.c
>> +++ b/net/openvswitch/vport.c
>> @@ -53,7 +53,10 @@ void ovs_vport_exit(void)
>>
>>  static struct hlist_head *hash_bucket(const struct net *net, const char *name)
>>  {
>> -       unsigned int hash = jhash(name, strlen(name), (unsigned long) net);
>> +       u32 seed = jhash_2words(lower_32_bits(net->net_cookie),
>> +                               upper_32_bits(net->net_cookie), 0);
> 
> Nit: hash_64(net->net_cookie, 32) would be simpler.

I agree.  Also, both jhash* and hash_64 actually return u32, so we should
probably swap the type of the local 'hash' variable here as well.  Having
a mix of u32 and unsigned int for the values of the same nature within the
same function is not the greatest.

Otherwise, the change looks fine to me.

Best regards, Ilya Maximets.
