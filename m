Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795682967;
	b=etViDftUWSoUKgi9QPgy6+PKrsaOxDgcfLk5g0D5G1IijoTZ1804YoQMFWqXVKF4Uxiw
	 +TLLxmmPXtnt++LvAyrAdr6MnJmrQFJ06hGaIAuVWTUvCyoJNIxe/ILUcUc3VkQiKCHRc
	 JwsZhZi5AQj6796XBBayvk/WKzI2y1QJkd7dEsoU1qiZ+bK6JbF6j7vEVa1prSsWOxVvu
	 GnWq32opiafzQIAbeKf5EOD6cyAsOsmqzDHEMZpeVseTJXMCnINMlYOgcvuY7+NGiaM0/
	 ErkyGWjo/T/8txHpGFtud8qG/U+T56a3dUchfS+xaIypwyUOeY+jpIiYh8/cZGrjBgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795682967;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=6Xcz3l/zZ6Iqj9au6rQ000kv3eoygO42XQVhjiRNctg=;
	b=O21FoakXj7rMpsU6gkqLq8SNVGhdlLtUNZR9BDRgbvU5K6OEjQB4ymOs+B3Zr+PVoUz3
	 jaDW3dyqRD+FofiuzYIcQvp7rJB/ad4zRPizEVDsEjBNVMRLssTqvpXJhs0QzpPqARFZ2
	 65+Z+IThDPx9w1XcJuJj5pod1Els1k7UG78Ykmnh2kMs8m55GzCRhKwNV8ZBSa0onFk1v
	 nlyIzU30pUzbAiuDbsmGrd0WiHtNXkb7+DmD34qxY2kI5GfJ4U7fttS0eCaIXqWKYFNyw
	 +8V2lWouUBZDftpvMAlNWfdFxIXD0aPkji4snRQawrsVGxvhht2w+EpUMbzvEGp0zrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blackwall.org;
	spf=none smtp.mailfrom=blackwall.org;
	dkim=pass header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=NnQCD0I0;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47206606A31C
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 08:49:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47206606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=NnQCD0I0
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so56359985e9.2
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 00:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1795682964; x=1796287764; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Xcz3l/zZ6Iqj9au6rQ000kv3eoygO42XQVhjiRNctg=;
        b=NnQCD0I0Gg0nUp7Md+Zohu8pUilderzxUcNpRTkIPTvwduhE73VpypZanTjlUdt46z
         DNcBcj9Mtr69nosAuXWyHLg6XU9EOAPPiKX2+fKaFBOpPVXUiY0+s60unaCaBaVwBzSR
         77iquBG4UyfBINmJfeoeYqsTbtAJddX12YcuZrfO5niAqv/WBeJMVRIXba7JRyfmGVAc
         Byq0+fpDqr0TxF8jqL/54Jd67aKB9Xj2STWSox8XwFavgIekQKF5gMegQQ53pxJuKjU9
         SysggfuZ+tR3j0xP0JjtmFH3FGAyf3mB91ZGbNVjvp/WCmGZQKVkBeslBOh93ntbDXKL
         62fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795682964; x=1796287764;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Xcz3l/zZ6Iqj9au6rQ000kv3eoygO42XQVhjiRNctg=;
        b=zd/1/6q7tt22jpLFGZDVl2S1CA0obp9D+66XCtrCKsc95qK+ealDgWs/S6epM7UD0W
         f26Pl3Amu+allT74HSTyhS5QxAmFnR+AFPCHq72CxYosegvYT26PeE/WH6DB6WEq/0ba
         HZrissBcMRXn98okmerr95VMKJiO5Xg6u/7u8JrEFPlamgJzQ8al460DKl0bOxO7L5Oj
         psGElQbz+BOy7Py9V1QzkznAuRTe2O/BD9xJfEYGLoIWkTQHpjTW8EvqK+WB3LZmqlBa
         cGw6TpJp8OdKDUZUeKmzoD8D3a/osivmb4711O5dudTKssSwXbZhBDm+egYI6dnqBw1F
         mmDA==
X-Gm-Message-State: APuU4Z9D9hqeY/68Vw4R33dh9j6qZIKMioYF1rAPrEbui23NKJZ/AYXV
	ZWA1yE3o7K1aF/0ALQ8qFtF00YucyVWNvjLKrSiSZRbA4fjKNez7VaG6t3sKjG22eKgLh29tweV
	fH1mcvHZosw==
X-Gm-Gg: AZFdTZdsqivfr5BNICOo8XdFDmparT+116hMR/AKkZIxHTe0FbXuCMQrhJTdH5G7KC0
	/DiqelqWLhKntsihudll7dmoLg1Xcgt0WyNrF2Ser6h8FomYim7MGQW/XgYcJZ+d5ydUOkfc16F
	XK+BOU3mUm9kCGcOtdJiQDKwI84OcmougH1R4mwmLhimjBo98ArdmxdUaeyXKdxCpCi6oJ71nL5
	ZQGUCFW+eqzUPqa2kcGDTBQlHnkQJ7neTeFSJ0pqAF1FVKWLQZnAtcDeGq7zeEna2vQhRLlNmsK
	3UNrU9sV2CKu+aJBhaKcqxhsXhv+eZ5EgrdQcCfuTUjFWcSnAbIfgTHnd64cDSKBve+tqGOCCMu
	s1I8u8mfejM/U0w6tlL63QSVMJvH5HtJ8KbVLzLH7zhhkbiCuBs5C3GptSXdp5dExI+Bsg2JYeQ
	f62V1SwhKX5ka307f36ExmmZ3MmPey+R7xScOiRtuLKWSKW7QL7CD+wEzcTSVlaIi6lFX2FEneC
	4kN649wBNPZdVwCXU4Xk7+aWamr/YozFjwyqCzveqh/QNHL/ns0B0LvgvwW78bUlz72dcgaGduR
	OIFq6wPN4TYbVDGzNbA4Qh6rsEOfOQ4qd3iTRzK1yBq5zMcx+AnbvOw+jHOpUYYWMGhyW01l0yV
	Nl1J/
X-Received: by 2002:a05:600c:4e87:b0:4a3:59c9:a758 with SMTP id 5b1f17b1804b1-4bb88922c81mr410025075e9.32.1795682964396;
        Thu, 26 Nov 2026 00:49:24 -0800 (PST)
Received: from [192.168.0.161] (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm1080362335e9.4.2026.11.26.00.49.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 00:49:23 -0800 (PST)
Message-ID: <cea8eaf8-ea5f-4165-84ff-a8b2a944ebb5@blackwall.org>
Date: Thu, 26 Nov 2026 10:49:22 +0200
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
Subject: Re: [PATCH net] net: keep skbs with a prefetched socket out of
 gro_cells gro
Content-Language: en-US, bg
To: willemb@google.com, netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, ast@kernel.org,
 kafai@fb.com, joe@wand.net.nz, daniel@iogearbox.net, bpf@vger.kernel.org
References: <20261121160204.4024204-1-razor@blackwall.org>
 <179548941922.3135.9577858774980848901@kernel.org>
 <38460544-04f5-41e0-b267-39c155bb08bb@blackwall.org>
 <willemb.1b39ecea58ba6@google.com>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <willemb.1b39ecea58ba6@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26/11/2026 02:36, willemb@google.com wrote:
> Nikolay Aleksandrov wrote:
>> On 24/11/2026 05:03, netdev-bot+sashiko@kernel.org wrote:
>> > Thank you for your contribution! Sashiko AI review found 1 potential
>> > issue(s) to consider.
>> >
>> > Critical: 0 · High: 1 · Medium: 0 · Low: 0
>> >
>> > If you believe none of the issues are legitimate, please reply to each
>> > issue of Medium severity or higher and explain why the AI is wrong.
>> > If any of them are legitimate and you plan to respin, please let patchwork
>> > know by including "pw-bot: cr" as a separate line at the end of your reply
>> > (one such reply per series is enough).
>> >
>> > - [High] The fix is incomplete.
>> >
>> > --
>> >
>> > net: keep skbs with a prefetched socket out of gro_cells gro
>> >
>> > This patch makes gro_cells_receive() send skbs that carry a prefetched
>> > socket from bpf_sk_assign() to netif_rx() instead of the GRO cell. The
>> > goal is to stop GRO from clearing skb->sk and skb->destructor on merged
>> > skbs, which leaks one socket reference per merged skb.
>> >
>> >> diff --git a/net/core/gro_cells.c b/net/core/gro_cells.c
>> >> index 31352cac355ce..4e8b9c3cd7da0 100644
>> >> --- a/net/core/gro_cells.c
>> >> +++ b/net/core/gro_cells.c
>> >
>> > [ ... ]
>> >
>> >> @@ -26,7 +27,8 @@ int gro_cells_receive(struct gro_cells *gcells, struct sk_buff *skb)
>> >>
>> >>       skb_unset_transport_header(skb);
>> >>
>> >> -    if (!gcells->cells || skb_cloned(skb) || netif_elide_gro(dev)) {
>> >> +    if (!gcells->cells || skb_cloned(skb) || netif_elide_gro(dev) ||
>> >> +        unlikely(skb_sk_is_prefetched(skb))) {
>> >
>> > [Severity: High]
>> > Is matching only skb->destructor == sock_pfree enough here? An skb that
>> > got its socket from bpf_sk_assign() can still reach gro_cells_receive()
>> > with a different destructor that owns one sk_refcnt reference per skb.
>> >
>> > One path: bpf_sk_assign() at tc ingress attaches a non-refcounted socket,
>> > such as a TCP listener or a UDP socket. It sets sock_pfree and takes no
>> > reference. ip_rcv_core() keeps it. Then an NFQUEUE rule matches the outer
>> > ipip/gre/esp packet, and __nf_queue() converts it:
>> >
> 
>> Oh well the bot seems right even though it's a weird case, I'd suggest to change
>> the check and orphan on any skb->sk set, i.e.: || unlikely(skb->sk)
>> instead of unlikely(skb_sk_is_prefetched(skb)), that is cache hot too as
>> skb->dev is read before and will catch
> 
>> Also tried asking an LLM if I'm missing something and the only case it could come up
>> that will not be aggregated is:
>> "the only correct aggregation that's lost is software ESP over veth or netdevsim in tunnel mode"
>> IMO that is ok.
> 
>> What do you think?
> 
> This also affects ESP over tuntap with IFF_NAPI. But that is not a common
> production configuration.
> 
> So LGTM.
> 
> Just a small note that redirect to netif_rx != orphan. No need to orphan.

Oh yes, of course. I was thinking and working on bpf_sk_assign egress support
which needs to orphan in a few places and blurped orphan when replying :)

Thanks!
