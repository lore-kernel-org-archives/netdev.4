Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540850;
	b=gm0t4vEqnAoYC8Az/SuLUAOrArx2WZVZxLWte55eyHJsV9GddB1ESbt61jpxx2KqCbHh
	 l9iHLI0+pp36fjXyU2Q0Ife2AbV96JwDBhPqnblT0gT6pvQdFEf7pucp7iTaBol883yZl
	 HvRz4/5IHxQN+7SdmM83owtVlDcmH0xX+ZCPGtF4/PlDOeYVhF3AZ9dAWIfjlXa8JQaMi
	 7GcJr8S8xoZWd9wC9lO+8WwTGLUAkdK5F3xXXXnxDRTioYtBl745kU4BcFNfIpKasEH+Z
	 iOVGXAk1En6gELwOUwG/hsFwlJK2arj8vn+biMU/wDBlFFEUUuF4G6+RmPLXwV7MYxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540850;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=srG2X7rKSpiGW0q0cEfhJuNeY45YswWrfZVuj/Jj1tg=;
	b=DXhh2R8Avch34vRgdzvGSJKG0SCud5pvGXk3alNDBY5x0SIueO0Wc1O7aeqrAbBMqmgp
	 UffKjKI1jEHpvvPC1LVvWcOaQoEKY3RtYOSSw2UF/yOWDUp/RBGY4tuOWgH6s6s2qXbn9
	 GNHM8X+5eCLkK2zcno2zRhHOPZYiQpvZj9kW6FJuQu/1CfPckl23aEsmy2fgwXINvHA0d
	 Inz5ASA6MDRNUPHhBkDwMsX14ZYTnL+3cTAdgoAUKUlAACXm/fttBIzicjQf9QUl3k8A+
	 uafaJWeuD2N+SsWc042YZRQ6PpID5ggQjKmUXj1F6AuL1YSnxtqSiz8/JAt09gT/fNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=miy7oAuE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF388606A327
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 17:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=miy7oAuE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFC701F000E1;
	Tue, 24 Nov 2026 17:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795540850;
	bh=srG2X7rKSpiGW0q0cEfhJuNeY45YswWrfZVuj/Jj1tg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=miy7oAuEuE+QaxGDnTSGnyZCRxsHYbUFp0sHNmP0/ZSUpDCBSbUw2DzK4SHXqyxOd
	 wkt51OfKAF2kjzu8I8b+y3tzZxyT8SYeMXVRN0n01jmUc3f7CkG4w97CFzkXQCjGcK
	 R080ne3MlGSSlUC9zZWfIFbpEAEUG3ivaTLPv9sNN1Dmgg0MyxDaCDo5bbAcAw6Hu/
	 duO5M7CszSoHJC8prWVG5UBcDqE+VcM2nsgIZd/kGjeCK1JBrfwluZnTt2W0ATvZlh
	 O/iHEkx7aAvuZDoCW2xCJQarPQeVvWRLzUVUgxxesAQvzr36pt3O9wN7n+H4B1MDdI
	 LDr5w9kcjmPHg==
Subject: Re: [PATCH net-next 15/15] batman-adv: tt: drop ADD+DEL events of
 never announced clients
From: netdev-bot+sashiko@kernel.org
To: sw@simonwunderlich.de
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 b.a.t.m.a.n@lists.open-mesh.org, sven@narfation.org
Date: Tue, 24 Nov 2026 17:20:49 +0000
Message-ID: <179554084949.3135.16426370585063518179@kernel.org>
In-Reply-To: <20261123171827.3294525-16-sw@simonwunderlich.de>
References: <20261123171827.3294525-16-sw@simonwunderlich.de>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] In net/batman-adv/translation-table.c, batadv_tt_local_event()
  allocates the new change node with…
- [Low] The new cancel path in batadv_tt_local_set_pending() (lines
  1957-1961) unhashes a NEW local entry as soon as a DEL cancels its…
- [Low] Some kernel-doc still describes removal of a local entry as
  always deferred, but after this patch it can be immediate.

--

batman-adv: tt: drop ADD+DEL events of never announced clients

With this patch, a DEL event cancels the queued initial ADD of a local
TT client that was never announced, and the local entry is removed from
the table right away. Each queued change node now records whether it is
the initial ADD of its client. An ADD queued after the initial ADD was
committed therefore stays non-cancellable.

> diff --git a/net/batman-adv/translation-table.c b/net/batman-adv/translation-table.c
> index 998c7f285e1df..c17cfee6ff84d 100644
> --- a/net/batman-adv/translation-table.c
> +++ b/net/batman-adv/translation-table.c
> @@ -651,13 +651,20 @@ static u16 batadv_tt_flags_get(struct batadv_tt_common_entry *common)

[ ... ]

>   * Only a single change per client is queued. It describes the latest state of
> - * the client and a new event therefore replaces an already queued one.
> + * the client and a new event therefore replaces an already queued one. The
> + * only exception is a DEL for a client whose initial ADD is still queued. The
> + * other nodes don't need to know anything about such a client and the ADD is
> + * cancelled instead.

[ ... ]

> @@ -669,12 +676,12 @@ static u16 batadv_tt_flags_get(struct batadv_tt_common_entry *common)

[ ... ]

> - * Return: true if the event was stored, false if the memory for it could not
> - * be allocated.
> + * Return: true if the event was stored (or cancelled a queued ADD), false if
> + * the memory for it could not be allocated.

[ ... ]

> @@ -685,6 +692,9 @@ static bool __batadv_tt_local_event(struct batadv_priv *bat_priv,
>  
>  	lockdep_assert_held(&common->flags_lock);
>  
> +	if (cancelled)
> +		*cancelled = false;
> +
>  	tt_change_node = kmem_cache_alloc(batadv_tt_change_cache, GFP_ATOMIC);
>  	if (!tt_change_node)
>  		return false;

[Severity: Low]
Can the cancellation be skipped under memory pressure? In
batadv_tt_local_event(), the new change node is allocated before
changes_list is searched for a queued initial ADD.

If this GFP_ATOMIC allocation fails while an initial_add entry for the
client is still queued, the function returns false and *cancelled stays
false. The cancel itself needs no memory. That branch only frees the
queued entry and the new node.

batadv_tt_local_set_pending() then takes the queued == false path. It
sets PENDING and del_unqueued and leaves the initial ADD in the list.
The next batadv_tt_local_commit_changes_nolock() announces the client as
an ADD. batadv_tt_local_purge_list() then requeues a DEL for the
following TTVN.

That matches the pre-patch behaviour, so the tables stay consistent.
However, the kernel-doc above describes the cancellation as
unconditional. The Return text also doesn't say that an allocation
failure skips it.

Would it make sense to search the list first and allocate only when
nothing matched? Alternatively, the kernel-doc could say that the
cancellation is best-effort.

[ ... ]

> @@ -1883,6 +1919,11 @@ static void batadv_tt_local_unhash(struct batadv_priv *bat_priv,
>   * retry it. Such an entry is marked as del_unqueued instead. It stays in the
>   * local table until batadv_tt_local_purge_list() was able to queue its DEL.
>   *
> + * A client whose initial ADD is still queued was never announced to the other
> + * nodes. Its DEL cancels the ADD and the entry is removed from the local table
> + * right away. The caller has to drop the hash reference of the entry after it
> + * released the flags_lock.
> + *

[Severity: Low]
This isn't a bug, but the first paragraph of the
batadv_tt_local_set_pending() kernel-doc still reads:

 * The entry is kept in the local table until the next TTVN increment
 * so that a consistency-check response can still be answered.

That is no longer always true with the new cancel path. Only this later
paragraph mentions the exception.

The summary line of batadv_tt_local_remove() also still says "logically
remove an entry from the local table". Through
batadv_tt_local_remove()->batadv_tt_local_remove_entry()->
batadv_tt_local_set_pending(), the entry can now be unhashed and freed
before any TTVN increment.

Could both comments be updated? The callers of batadv_tt_local_remove()
in mesh-interface.c and multicast.c rely on that description.

[ ... ]

> @@ -1907,8 +1952,13 @@ batadv_tt_local_set_pending(struct batadv_priv *bat_priv,
>  	lockdep_assert_held(&hash->list_locks[i]);
>  	lockdep_assert_held(&common->flags_lock);
>  
> -	queued = __batadv_tt_local_event(bat_priv, common,
> -					 common->flags | flags);
> +	queued = batadv_tt_local_event(bat_priv, common, common->flags | flags,
> +				       false, &cancelled);
> +	if (cancelled) {
> +		/* the entry was never announced */
> +		batadv_tt_local_unhash(bat_priv, tt_local_entry, message);
> +		return true;
> +	}

[Severity: Low]
Does this hold when the DEL comes from a roaming event? The commit
message says:

  The other nodes never heard about the client and don't need a DEL
  for it.

When the entry was inserted, batadv_tt_local_add_roam() may already have
sent a ROAMING_ADV to the previous originator:

	hlist_for_each_entry_rcu(orig_entry, head, list) {
		batadv_send_roam_adv(bat_priv, tt_global->common.key.addr,
				     tt_global->common.key.vid,
				     orig_entry->orig_node);
	}

The previous originator (call it C) then creates a ROAM-flagged global
entry that points to this node (A). It also marks its own local entry
ROAM|PENDING.

This also happens when a client roams back. When C's ROAMING_ADV is
merged, batadv_tt_global_merge_flags() clears ROAM on the global entry.
The early return in batadv_tt_local_add_roam() therefore doesn't prevent
A's ROAMING_ADV.

Just before this call, batadv_tt_local_remove_entry() marks the entry
for later rerouting:

net/batman-adv/translation-table.c:batadv_tt_local_remove_entry() {
	...
		/* if this global entry addition is due to a roaming, the node
		 * has to mark the local entry as "roamed" in order to
		 * correctly reroute packets later
		 */
		if (roaming)
			common->flags |= BATADV_TT_CLIENT_ROAM;
	...
}

With the cancel path, the entry is unhashed in the same flags_lock
section, so this ROAM mark is lost immediately.

First, the local roaming reroute seems to be lost. After the unhash,
batadv_tt_local_client_is_roaming() no longer finds the entry, so
batadv_check_unicast_ttvn() skips the reroute. Take a unicast packet for
the client that carries A's current TTVN, for example one that C
rerouted to A. It is now delivered locally instead of being sent back.
Before this patch it was rerouted until the next commit.

Second, C can keep stale state. Consider client X:

  X roams C->A, A sends a ROAMING_ADV to C
  C commits DEL|ROAM for X, A frees its global X on that DEL
  X reappears at C as a new local entry
  batadv_tt_local_add_roam() on C returns early, because C's global
    X->A carries ROAM
  C announces ADD X, which reaches A before A commits its initial ADD
  on A: batadv_tt_global_add()->batadv_tt_global_purge_local()->
    batadv_tt_local_remove(roaming=false) cancels A's initial ADD

A then sends nothing for X. Before this patch, the merged change went
out as DEL X, and batadv_tt_global_del() on C removed the stale entry.
Now C keeps the ROAM-flagged global entry X->A until
BATADV_TT_CLIENT_ROAM_TIMEOUT expires (600 seconds).

Should the cancel path be skipped for roaming DELs, or for clients that
already sent a ROAMING_ADV?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261123171827.3294525-2-sw%40simonwunderlich.de
